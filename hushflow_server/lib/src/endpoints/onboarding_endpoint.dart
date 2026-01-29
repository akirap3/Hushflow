import 'package:serverpod/serverpod.dart';
import '../generated/sender.dart';
import '../generated/sender_candidate.dart';
import '../generated/whitelist_confirm_result.dart';
import '../services/gmail_service.dart';

/// Onboarding Endpoint
/// Handles first-time Gmail scanning and whitelist confirmation
class OnboardingEndpoint extends Endpoint {
  
  /// Scan Gmail for subscription/newsletter senders
  /// Called on first login to build whitelist candidates
  Future<List<SenderCandidate>> scanForSubscriptions(
    Session session,
    String accessToken, {
    int maxEmails = 200,
  }) async {
    session.log('Starting Gmail scan for subscriptions');
    
    final gmail = GmailService(accessToken);
    final results = await gmail.scanForSubscriptions(maxResults: maxEmails);
    
    session.log('Found ${results.length} unique senders, '
        '${results.where((r) => r.isSubscription).length} detected as subscriptions');
    
    // Convert to typed SenderCandidate objects
    return results.map((r) => SenderCandidate(
      email: r.email,
      name: r.name.isEmpty ? null : r.name,
      isSubscription: r.isSubscription,
      subscriptionSignals: r.subscriptionSignals,
      emailCount: r.emailCount,
    )).toList();
  }
  
  /// Confirm whitelist selections from user
  /// Creates Sender records with isWhitelisted = true for confirmed senders
  Future<WhitelistConfirmResult> confirmWhitelist(
    Session session,
    int userId,
    List<SenderCandidate> confirmedSenders,
  ) async {
    session.log('Confirming ${confirmedSenders.length} senders for whitelist for user $userId');
    
    int created = 0;
    int updated = 0;
    
    for (final senderData in confirmedSenders) {
      try {
        final email = senderData.email;
        final name = senderData.name ?? '';
        final isSubscription = senderData.isSubscription;
        
        session.log('Processing sender: $email');
        
        // Check if sender already exists
        final existing = await Sender.db.findFirstRow(
          session,
          where: (s) => s.userId.equals(userId) & s.email.equals(email),
        );
        
        if (existing != null) {
          // Update existing sender to whitelist
          session.log('Updating existing sender: $email');
          await Sender.db.updateRow(
            session,
            existing.copyWith(
              isWhitelisted: true,
              isSubscription: isSubscription,
              updatedAt: DateTime.now(),
            ),
          );
          updated++;
        } else {
          // Create new whitelisted sender
          session.log('Creating new sender: $email for user $userId');
          await Sender.db.insertRow(
            session,
            Sender(
              userId: userId,
              email: email,
              name: name.isEmpty ? null : name,
              isExcluded: false,
              isBlocked: false,
              isWhitelisted: true,
              isSubscription: isSubscription,
              totalEmails: 0,
              openedEmails: 0,
              detectedAt: DateTime.now(),
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
          );
          created++;
        }
      } catch (e, stackTrace) {
        session.log('Error processing sender ${senderData.email}: $e');
        session.log('Stack trace: $stackTrace');
        // Continue with next sender instead of failing completely
      }
    }
    
    session.log('Whitelist confirmed: $created created, $updated updated');
    
    return WhitelistConfirmResult(
      success: true,
      created: created,
      updated: updated,
      totalWhitelisted: confirmedSenders.length,
    );
  }
  
  /// Get current whitelist for user
  Future<List<Map<String, dynamic>>> getWhitelist(Session session, int userId) async {
    final senders = await Sender.db.find(
      session,
      where: (s) => s.userId.equals(userId) & s.isWhitelisted.equals(true),
      orderBy: (s) => s.email,
    );
    
    return senders.map((s) => {
      'id': s.id,
      'email': s.email,
      'name': s.name,
      'isSubscription': s.isSubscription,
      'totalEmails': s.totalEmails,
      'lastEmailAt': s.lastEmailAt?.toIso8601String(),
    }).toList();
  }
  
  /// Add sender to whitelist
  Future<bool> addToWhitelist(
    Session session,
    int userId,
    String email,
    String? name,
  ) async {
    final existing = await Sender.db.findFirstRow(
      session,
      where: (s) => s.userId.equals(userId) & s.email.equals(email),
    );
    
    if (existing != null) {
      await Sender.db.updateRow(
        session,
        existing.copyWith(
          isWhitelisted: true,
          updatedAt: DateTime.now(),
        ),
      );
    } else {
      await Sender.db.insertRow(
        session,
        Sender(
          userId: userId,
          email: email,
          name: name,
          isExcluded: false,
          isBlocked: false,
          isWhitelisted: true,
          isSubscription: true,
          totalEmails: 0,
          openedEmails: 0,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
    }
    
    return true;
  }
  
  /// Remove sender from whitelist
  Future<bool> removeFromWhitelist(Session session, int userId, String email) async {
    final existing = await Sender.db.findFirstRow(
      session,
      where: (s) => s.userId.equals(userId) & s.email.equals(email),
    );
    
    if (existing != null) {
      await Sender.db.updateRow(
        session,
        existing.copyWith(
          isWhitelisted: false,
          updatedAt: DateTime.now(),
        ),
      );
      return true;
    }
    
    return false;
  }
}

import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../services/gmail_service.dart';
import '../services/ml_service.dart';

/// Summary Endpoint
/// Handles AI-generated email digest summaries
class SummaryEndpoint extends Endpoint {
  
  /// Get list of summaries
  /// Currently generates dynamic "Weekly Digests" for demonstration
  Future<List<Summary>> listSummaries(Session session, int userId) async {
    session.log('Listing summaries for user $userId');
    
    // Generate 5 mock summaries based on current date
    final now = DateTime.now();
    return List.generate(5, (index) {
      final date = now.subtract(Duration(days: index * 7));
      return Summary(
        id: index + 1, // Mock ID
        userId: userId,
        title: 'Weekly Digest #${5 - index}',
        content: 'Your weekly summary of subscription emails.',
        emailCount: 10 + (index * 2), // Mock count
        generatedAt: date,
        periodStart: date.subtract(const Duration(days: 7)),
        periodEnd: date,
        isRead: index > 0, // Mark older ones as read
      );
    });
  }

  /// Get single summary with items populated from real Gmail data
  /// This simulates a "Weekly Digest" by fetching the user's recent emails
  Future<SummaryDetails?> getSummaryDetails(Session session, String accessToken, int summaryId) async {
    session.log('Getting summary details for $summaryId');
    
    final gmail = GmailService(accessToken);
    
    // Fetch recent emails to populate the summary
    final messages = await gmail.fetchMessages(maxResults: 20);
    
    // Convert to SummaryItems
    final items = <SummaryItem>[];
    for (var i = 0; i < messages.length; i++) {
        final msg = messages[i];
        final headers = msg['headers'] as Map<String, String>;
        final subject = headers['subject'] ?? '(no subject)';
        final from = headers['from'] ?? 'unknown';
        final snippet = msg['snippet'] as String;
        
        // Mock scoring (or use ML service if needed, but simple hash for consistency here)
        final priorityScore = 0.5 + (subject.length % 5) / 10.0;
        
        items.add(SummaryItem(
            summaryId: summaryId,
            emailId: 0, // Placeholder
            sender: from.contains('<') ? from.split('<')[0].trim().replaceAll('"', '') : from,
            subject: subject,
            summaryText: snippet, // Use snippet as summary for now
            priorityScore: priorityScore,
            order: i,
        ));
    }
    
    // Create the parent summary object
    final summary = Summary(
        userId: 0, 
        title: 'Weekly Email Digest',
        content: 'Here is your summary for the week.',
        emailCount: items.length,
        generatedAt: DateTime.now(),
        periodStart: DateTime.now().subtract(const Duration(days: 7)),
        periodEnd: DateTime.now(),
        isRead: true,
    );

    return SummaryDetails(summary: summary, items: items);
  }
}

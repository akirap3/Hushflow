import 'package:serverpod/serverpod.dart';

/// Email Endpoint
/// Handles email listing, fetching, and interaction tracking
class EmailEndpoint extends Endpoint {
  /// Get paginated list of emails for user
  Future<Map<String, dynamic>> listEmails(
    Session session,
    int userId,
    int page,
    int pageSize,
    bool unreadOnly,
    bool subscriptionsOnly,
  ) async {
    session.log('Listing emails for user $userId');
    
    return {
      'emails': <Map<String, dynamic>>[],
      'totalCount': 0,
      'page': page,
      'pageSize': pageSize,
    };
  }

  /// Get single email by ID
  Future<Map<String, dynamic>?> getEmail(Session session, int emailId) async {
    return null;
  }

  /// Mark email as read and track interaction
  Future<bool> markAsRead(Session session, int emailId, int? interactionTimeSeconds) async {
    session.log('Marking email $emailId as read');
    return true;
  }

  /// Track email click
  Future<bool> trackClick(Session session, int emailId, String? linkUrl) async {
    session.log('Tracking click on email $emailId');
    return true;
  }

  /// Get stale emails (unread for 30+ days)
  Future<Map<String, dynamic>> getStaleEmails(Session session, int userId, int daysThreshold) async {
    return {
      'emails': <Map<String, dynamic>>[],
      'totalCount': 0,
    };
  }

  /// Trigger cold start: fetch and process last 300 emails
  Future<Map<String, dynamic>> triggerColdStart(Session session, int userId, String accessToken) async {
    session.log('Starting cold start for user $userId');
    
    return {
      'success': true,
      'emailsProcessed': 0,
      'modelTrained': false,
    };
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:serverpod/serverpod.dart';

/// Gmail Webhook Route handler
/// Receives push notifications from Gmail Pub/Sub
class GmailWebhookRoute extends WidgetRoute {
  @override
  Future<WidgetJson> build(Session session, HttpRequest request) async {
    if (request.method != 'POST') {
      return WidgetJson(object: {'error': 'Method not allowed'});
    }

    try {
      // Read request body
      final body = await utf8.decoder.bind(request).join();
      final payload = jsonDecode(body) as Map<String, dynamic>;

      // Extract Pub/Sub message
      final message = payload['message'] as Map<String, dynamic>?;
      if (message == null) {
        return WidgetJson(object: {'error': 'Missing message'});
      }

      // Decode base64 data from Pub/Sub
      final data = message['data'] as String?;
      if (data == null) {
        return WidgetJson(object: {'error': 'Missing data'});
      }

      final decodedData = utf8.decode(base64Decode(data));
      final notification = jsonDecode(decodedData) as Map<String, dynamic>;

      final historyId = notification['historyId'] as String?;
      final emailAddress = notification['emailAddress'] as String?;

      // Log the webhook
      session.log('Gmail webhook received: historyId=$historyId, email=$emailAddress');

      // In production, queue to database or use Redis directly
      // For now, just log - the actual implementation would insert into webhook_logs table
      await _logWebhook(session, historyId, emailAddress, body);

      return WidgetJson(object: {'status': 'ACK'});
    } catch (e, stackTrace) {
      session.log('Gmail webhook error: $e', level: LogLevel.error, stackTrace: stackTrace);
      return WidgetJson(object: {'error': 'Internal error'});
    }
  }

  Future<void> _logWebhook(
    Session session,
    String? historyId,
    String? emailAddress,
    String payload,
  ) async {
    if (historyId == null || emailAddress == null) return;

    // Log to database via generated model
    // In a full implementation:
    // final log = WebhookLog(
    //   messageId: '${DateTime.now().millisecondsSinceEpoch}_$emailAddress',
    //   historyId: historyId,
    //   payload: payload,
    //   status: 'received',
    //   receivedAt: DateTime.now(),
    // );
    // await WebhookLog.insert(session, log);
    
    session.log('Webhook queued: historyId=$historyId, email=$emailAddress');
  }
}

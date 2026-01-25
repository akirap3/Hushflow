import 'dart:convert';
import 'package:http/http.dart' as http;

/// Gmail API utility for scanning and detecting subscription emails
class GmailService {
  final String accessToken;
  
  GmailService(this.accessToken);
  
  /// Fetch recent emails and extract sender info
  Future<List<EmailScanResult>> scanForSubscriptions({int maxResults = 200}) async {
    final messages = await _listMessages(maxResults: maxResults);
    final results = <String, EmailScanResult>{};
    
    for (final msgId in messages) {
      final headers = await _getMessageHeaders(msgId);
      if (headers == null) continue;
      
      final from = headers['from'] ?? '';
      final email = _extractEmail(from);
      if (email.isEmpty) continue;
      
      // Check if already processed
      if (!results.containsKey(email)) {
        results[email] = EmailScanResult(
          email: email,
          name: _extractName(from),
          isSubscription: false,
          subscriptionSignals: [],
        );
      }
      
      final result = results[email]!;
      result.emailCount++;
      
      // Detect subscription signals
      if (headers.containsKey('list-unsubscribe')) {
        result.isSubscription = true;
        if (!result.subscriptionSignals.contains('list-unsubscribe')) {
          result.subscriptionSignals.add('list-unsubscribe');
        }
      }
      
      final precedence = headers['precedence']?.toLowerCase() ?? '';
      if (precedence == 'bulk' || precedence == 'list') {
        result.isSubscription = true;
        if (!result.subscriptionSignals.contains('precedence-bulk')) {
          result.subscriptionSignals.add('precedence-bulk');
        }
      }
      
      // Check known newsletter domains
      if (_isKnownNewsletterDomain(email)) {
        result.isSubscription = true;
        if (!result.subscriptionSignals.contains('known-domain')) {
          result.subscriptionSignals.add('known-domain');
        }
      }
    }
    
    return results.values.toList()
      ..sort((a, b) {
        // Sort: subscriptions first, then by email count
        if (a.isSubscription != b.isSubscription) {
          return a.isSubscription ? -1 : 1;
        }
        return b.emailCount.compareTo(a.emailCount);
      });
  }
  
  /// List message IDs
  Future<List<String>> _listMessages({int maxResults = 200}) async {
    final uri = Uri.parse(
      'https://gmail.googleapis.com/gmail/v1/users/me/messages'
      '?maxResults=$maxResults'
    );
    
    final response = await http.get(uri, headers: {
      'Authorization': 'Bearer $accessToken',
    });
    
    if (response.statusCode != 200) {
      throw Exception('Failed to list messages: ${response.body}');
    }
    
    final data = json.decode(response.body);
    final messages = data['messages'] as List<dynamic>? ?? [];
    return messages.map((m) => m['id'] as String).toList();
  }
  
  /// Get message headers
  Future<Map<String, String>?> _getMessageHeaders(String messageId) async {
    final uri = Uri.parse(
      'https://gmail.googleapis.com/gmail/v1/users/me/messages/$messageId'
      '?format=metadata&metadataHeaders=From&metadataHeaders=List-Unsubscribe&metadataHeaders=Precedence'
    );
    
    final response = await http.get(uri, headers: {
      'Authorization': 'Bearer $accessToken',
    });
    
    if (response.statusCode != 200) return null;
    
    final data = json.decode(response.body);
    final payload = data['payload'] as Map<String, dynamic>?;
    final headers = payload?['headers'] as List<dynamic>? ?? [];
    
    final result = <String, String>{};
    for (final header in headers) {
      final name = (header['name'] as String).toLowerCase();
      final value = header['value'] as String;
      result[name] = value;
    }
    
    return result;
  }
  
  /// Extract email from "Name <email@example.com>" format
  String _extractEmail(String from) {
    final match = RegExp(r'<([^>]+)>').firstMatch(from);
    if (match != null) return match.group(1)!.toLowerCase();
    
    // Maybe just email without angle brackets
    if (from.contains('@')) return from.trim().toLowerCase();
    return '';
  }
  
  /// Extract name from "Name <email@example.com>" format
  String _extractName(String from) {
    final idx = from.indexOf('<');
    if (idx > 0) return from.substring(0, idx).trim().replaceAll('"', '');
    return '';
  }
  
  /// Check if email is from known newsletter/marketing domain
  bool _isKnownNewsletterDomain(String email) {
    final knownDomains = [
      'mailchimp.com',
      'sendgrid.net',
      'substack.com',
      'beehiiv.com',
      'convertkit.com',
      'mailerlite.com',
      'klaviyo.com',
      'constantcontact.com',
      'hubspot.com',
      'mailgun.org',
      'amazonses.com',
      'postmarkapp.com',
      'sendinblue.com',
      'campaign-archive.com',
      'list-manage.com',
    ];
    
    final domain = email.split('@').last;
    return knownDomains.any((d) => domain.contains(d));
  }
}

/// Result of scanning an email sender
class EmailScanResult {
  final String email;
  final String name;
  bool isSubscription;
  final List<String> subscriptionSignals;
  int emailCount;
  
  EmailScanResult({
    required this.email,
    required this.name,
    required this.isSubscription,
    required this.subscriptionSignals,
    this.emailCount = 0,
  });
  
  Map<String, dynamic> toJson() => {
    'email': email,
    'name': name,
    'isSubscription': isSubscription,
    'subscriptionSignals': subscriptionSignals,
    'emailCount': emailCount,
  };
}

/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:hushflow_client/src/protocol/sender_priority.dart' as _i3;
import 'package:hushflow_client/src/protocol/sender_candidate.dart' as _i4;
import 'package:hushflow_client/src/protocol/whitelist_confirm_result.dart'
    as _i5;
import 'protocol.dart' as _i6;

/// Auth Endpoint
/// Handles Gmail OAuth flow and user session management
/// {@category Endpoint}
class EndpointAuth extends _i1.EndpointRef {
  EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  /// Get OAuth authorization URL
  _i2.Future<String> getAuthUrl(String state) =>
      caller.callServerEndpoint<String>(
        'auth',
        'getAuthUrl',
        {'state': state},
      );

  /// Exchange authorization code for tokens
  _i2.Future<Map<String, dynamic>> exchangeCode(String code) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'auth',
        'exchangeCode',
        {'code': code},
      );

  /// Refresh access token
  _i2.Future<Map<String, dynamic>> refreshToken(String refreshToken) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'auth',
        'refreshToken',
        {'refreshToken': refreshToken},
      );

  /// Setup Gmail Pub/Sub watch
  _i2.Future<Map<String, dynamic>> setupWatch(
    String accessToken,
    String topicName,
  ) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'auth',
        'setupWatch',
        {
          'accessToken': accessToken,
          'topicName': topicName,
        },
      );
}

/// Cleanup Endpoint
/// Handles monthly cleanup butler functionality
/// {@category Endpoint}
class EndpointCleanup extends _i1.EndpointRef {
  EndpointCleanup(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'cleanup';

  /// Get cleanup candidates (unread 30+ days)
  _i2.Future<Map<String, dynamic>> getCandidates(
    int userId,
    int daysThreshold,
  ) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'cleanup',
        'getCandidates',
        {
          'userId': userId,
          'daysThreshold': daysThreshold,
        },
      );

  /// Queue batch action for emails
  _i2.Future<Map<String, dynamic>> queueBatchAction(
    int userId,
    List<int> emailIds,
    String action,
  ) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'cleanup',
        'queueBatchAction',
        {
          'userId': userId,
          'emailIds': emailIds,
          'action': action,
        },
      );

  /// Execute pending unsubscribe actions
  _i2.Future<Map<String, dynamic>> executeUnsubscribes(
    int userId,
    int limit,
  ) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'cleanup',
        'executeUnsubscribes',
        {
          'userId': userId,
          'limit': limit,
        },
      );

  /// Get pending unsubscribe queue
  _i2.Future<List<Map<String, dynamic>>> getPendingQueue(int userId) =>
      caller.callServerEndpoint<List<Map<String, dynamic>>>(
        'cleanup',
        'getPendingQueue',
        {'userId': userId},
      );

  /// Add sender exclusion
  _i2.Future<bool> excludeSender(
    int userId,
    String senderEmail,
    String? reason,
  ) =>
      caller.callServerEndpoint<bool>(
        'cleanup',
        'excludeSender',
        {
          'userId': userId,
          'senderEmail': senderEmail,
          'reason': reason,
        },
      );

  /// Remove sender exclusion
  _i2.Future<bool> unexcludeSender(
    int userId,
    String senderEmail,
  ) =>
      caller.callServerEndpoint<bool>(
        'cleanup',
        'unexcludeSender',
        {
          'userId': userId,
          'senderEmail': senderEmail,
        },
      );

  /// Get excluded senders
  _i2.Future<List<Map<String, dynamic>>> getExcludedSenders(int userId) =>
      caller.callServerEndpoint<List<Map<String, dynamic>>>(
        'cleanup',
        'getExcludedSenders',
        {'userId': userId},
      );
}

/// Email Endpoint
/// Handles email listing, fetching, and interaction tracking
/// {@category Endpoint}
class EndpointEmail extends _i1.EndpointRef {
  EndpointEmail(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'email';

  /// Get paginated list of emails for user
  _i2.Future<Map<String, dynamic>> listEmails(
    int userId,
    int page,
    int pageSize,
    bool unreadOnly,
    bool subscriptionsOnly,
  ) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'email',
        'listEmails',
        {
          'userId': userId,
          'page': page,
          'pageSize': pageSize,
          'unreadOnly': unreadOnly,
          'subscriptionsOnly': subscriptionsOnly,
        },
      );

  /// Get single email by ID
  _i2.Future<Map<String, dynamic>?> getEmail(int emailId) =>
      caller.callServerEndpoint<Map<String, dynamic>?>(
        'email',
        'getEmail',
        {'emailId': emailId},
      );

  /// Mark email as read and track interaction
  _i2.Future<bool> markAsRead(
    int emailId,
    int? interactionTimeSeconds,
  ) =>
      caller.callServerEndpoint<bool>(
        'email',
        'markAsRead',
        {
          'emailId': emailId,
          'interactionTimeSeconds': interactionTimeSeconds,
        },
      );

  /// Track email click
  _i2.Future<bool> trackClick(
    int emailId,
    String? linkUrl,
  ) =>
      caller.callServerEndpoint<bool>(
        'email',
        'trackClick',
        {
          'emailId': emailId,
          'linkUrl': linkUrl,
        },
      );

  /// Get stale emails (unread for 30+ days)
  _i2.Future<Map<String, dynamic>> getStaleEmails(
    int userId,
    int daysThreshold,
  ) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'email',
        'getStaleEmails',
        {
          'userId': userId,
          'daysThreshold': daysThreshold,
        },
      );

  /// Trigger cold start: fetch and process last 300 emails
  _i2.Future<Map<String, dynamic>> triggerColdStart(
    int userId,
    String accessToken,
  ) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'email',
        'triggerColdStart',
        {
          'userId': userId,
          'accessToken': accessToken,
        },
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// ML Endpoint
/// Provides email priority predictions using the Python ML service
/// {@category Endpoint}
class EndpointMl extends _i1.EndpointRef {
  EndpointMl(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'ml';

  /// Get priority score for a single email
  _i2.Future<double> predictPriority(
    int userId,
    String subject,
    String body,
    DateTime receivedAt,
    bool hasUnsubscribe,
    int linkCount,
    int imageCount,
  ) =>
      caller.callServerEndpoint<double>(
        'ml',
        'predictPriority',
        {
          'userId': userId,
          'subject': subject,
          'body': body,
          'receivedAt': receivedAt,
          'hasUnsubscribe': hasUnsubscribe,
          'linkCount': linkCount,
          'imageCount': imageCount,
        },
      );

  /// Get priority scores for multiple emails (batch)
  /// Each email should be a map with: subject, body, receivedAt, hasUnsubscribe, linkCount, imageCount
  _i2.Future<List<double>> predictBatch(
    int userId,
    List<Map<String, dynamic>> emailsData,
  ) =>
      caller.callServerEndpoint<List<double>>(
        'ml',
        'predictBatch',
        {
          'userId': userId,
          'emailsData': emailsData,
        },
      );

  /// Analyze inbox and group by sender with priority scores
  _i2.Future<List<_i3.SenderPriority>> analyzeInbox(
    String accessToken,
    int userId, {
    required int maxEmails,
  }) =>
      caller.callServerEndpoint<List<_i3.SenderPriority>>(
        'ml',
        'analyzeInbox',
        {
          'accessToken': accessToken,
          'userId': userId,
          'maxEmails': maxEmails,
        },
      );
}

/// Onboarding Endpoint
/// Handles first-time Gmail scanning and whitelist confirmation
/// {@category Endpoint}
class EndpointOnboarding extends _i1.EndpointRef {
  EndpointOnboarding(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'onboarding';

  /// Scan Gmail for subscription/newsletter senders
  /// Called on first login to build whitelist candidates
  _i2.Future<List<_i4.SenderCandidate>> scanForSubscriptions(
    String accessToken, {
    required int maxEmails,
  }) =>
      caller.callServerEndpoint<List<_i4.SenderCandidate>>(
        'onboarding',
        'scanForSubscriptions',
        {
          'accessToken': accessToken,
          'maxEmails': maxEmails,
        },
      );

  /// Confirm whitelist selections from user
  /// Creates Sender records with isWhitelisted = true for confirmed senders
  _i2.Future<_i5.WhitelistConfirmResult> confirmWhitelist(
    int userId,
    List<_i4.SenderCandidate> confirmedSenders,
  ) =>
      caller.callServerEndpoint<_i5.WhitelistConfirmResult>(
        'onboarding',
        'confirmWhitelist',
        {
          'userId': userId,
          'confirmedSenders': confirmedSenders,
        },
      );

  /// Get current whitelist for user
  _i2.Future<List<Map<String, dynamic>>> getWhitelist(int userId) =>
      caller.callServerEndpoint<List<Map<String, dynamic>>>(
        'onboarding',
        'getWhitelist',
        {'userId': userId},
      );

  /// Add sender to whitelist
  _i2.Future<bool> addToWhitelist(
    int userId,
    String email,
    String? name,
  ) =>
      caller.callServerEndpoint<bool>(
        'onboarding',
        'addToWhitelist',
        {
          'userId': userId,
          'email': email,
          'name': name,
        },
      );

  /// Remove sender from whitelist
  _i2.Future<bool> removeFromWhitelist(
    int userId,
    String email,
  ) =>
      caller.callServerEndpoint<bool>(
        'onboarding',
        'removeFromWhitelist',
        {
          'userId': userId,
          'email': email,
        },
      );
}

/// Summary Endpoint
/// Handles AI-generated email digest summaries
/// {@category Endpoint}
class EndpointSummary extends _i1.EndpointRef {
  EndpointSummary(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'summary';

  /// Get paginated list of summaries
  _i2.Future<Map<String, dynamic>> listSummaries(
    int userId,
    int page,
    int pageSize,
  ) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'summary',
        'listSummaries',
        {
          'userId': userId,
          'page': page,
          'pageSize': pageSize,
        },
      );

  /// Get single summary with items
  _i2.Future<Map<String, dynamic>?> getSummary(int summaryId) =>
      caller.callServerEndpoint<Map<String, dynamic>?>(
        'summary',
        'getSummary',
        {'summaryId': summaryId},
      );

  /// Generate a new summary for time period
  _i2.Future<Map<String, dynamic>> generateSummary(
    int userId,
    DateTime periodStart,
    DateTime periodEnd,
    bool includeAudio,
  ) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'summary',
        'generateSummary',
        {
          'userId': userId,
          'periodStart': periodStart,
          'periodEnd': periodEnd,
          'includeAudio': includeAudio,
        },
      );

  /// Mark summary as read
  _i2.Future<bool> markAsRead(int summaryId) => caller.callServerEndpoint<bool>(
        'summary',
        'markAsRead',
        {'summaryId': summaryId},
      );

  /// Get audio URL for summary
  _i2.Future<String?> getAudioUrl(int summaryId) =>
      caller.callServerEndpoint<String?>(
        'summary',
        'getAudioUrl',
        {'summaryId': summaryId},
      );

  /// Set summary schedule for user
  _i2.Future<bool> setSchedule(
    int userId,
    String cronExpression,
    String timezone,
  ) =>
      caller.callServerEndpoint<bool>(
        'summary',
        'setSchedule',
        {
          'userId': userId,
          'cronExpression': cronExpression,
          'timezone': timezone,
        },
      );

  /// Get current schedule
  _i2.Future<Map<String, dynamic>?> getSchedule(int userId) =>
      caller.callServerEndpoint<Map<String, dynamic>?>(
        'summary',
        'getSchedule',
        {'userId': userId},
      );
}

/// Voice Endpoint
/// Handles voice commands and audio briefings
/// {@category Endpoint}
class EndpointVoice extends _i1.EndpointRef {
  EndpointVoice(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'voice';

  /// Parse voice command intent
  _i2.Future<Map<String, dynamic>> parseIntent(String transcript) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'voice',
        'parseIntent',
        {'transcript': transcript},
      );

  /// Generate audio briefing
  _i2.Future<Map<String, dynamic>> generateBriefing(
    int userId,
    int maxEmails,
  ) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'voice',
        'generateBriefing',
        {
          'userId': userId,
          'maxEmails': maxEmails,
        },
      );

  /// Execute voice command action
  _i2.Future<Map<String, dynamic>> executeAction(
    int userId,
    String intent,
    Map<String, dynamic> entities,
  ) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'voice',
        'executeAction',
        {
          'userId': userId,
          'intent': intent,
          'entities': entities,
        },
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
  }) : super(
          host,
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
        ) {
    auth = EndpointAuth(this);
    cleanup = EndpointCleanup(this);
    email = EndpointEmail(this);
    example = EndpointExample(this);
    ml = EndpointMl(this);
    onboarding = EndpointOnboarding(this);
    summary = EndpointSummary(this);
    voice = EndpointVoice(this);
  }

  late final EndpointAuth auth;

  late final EndpointCleanup cleanup;

  late final EndpointEmail email;

  late final EndpointExample example;

  late final EndpointMl ml;

  late final EndpointOnboarding onboarding;

  late final EndpointSummary summary;

  late final EndpointVoice voice;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'auth': auth,
        'cleanup': cleanup,
        'email': email,
        'example': example,
        'ml': ml,
        'onboarding': onboarding,
        'summary': summary,
        'voice': voice,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}

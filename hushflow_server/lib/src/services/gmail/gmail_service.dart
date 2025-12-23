import 'dart:convert';
import 'package:http/http.dart' as http;

/// Gmail API Service for OAuth and email operations
class GmailService {
  static const String _baseUrl = 'https://gmail.googleapis.com/gmail/v1';
  static const String _authUrl = 'https://accounts.google.com/o/oauth2/v2/auth';
  static const String _tokenUrl = 'https://oauth2.googleapis.com/token';

  final String clientId;
  final String clientSecret;
  final String redirectUri;

  GmailService({
    required this.clientId,
    required this.clientSecret,
    required this.redirectUri,
  });

  /// Generate OAuth authorization URL
  String getAuthorizationUrl({required String state}) {
    final scopes = [
      'https://www.googleapis.com/auth/gmail.readonly',
      'https://www.googleapis.com/auth/gmail.modify',
      'https://www.googleapis.com/auth/gmail.labels',
      'https://mail.google.com/',
    ];

    final params = {
      'client_id': clientId,
      'redirect_uri': redirectUri,
      'response_type': 'code',
      'scope': scopes.join(' '),
      'access_type': 'offline',
      'prompt': 'consent',
      'state': state,
    };

    return Uri.parse(_authUrl).replace(queryParameters: params).toString();
  }

  /// Exchange authorization code for tokens
  Future<TokenResponse> exchangeCode(String code) async {
    final response = await http.post(
      Uri.parse(_tokenUrl),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'client_id': clientId,
        'client_secret': clientSecret,
        'code': code,
        'grant_type': 'authorization_code',
        'redirect_uri': redirectUri,
      },
    );

    if (response.statusCode != 200) {
      throw GmailApiException('Token exchange failed: ${response.body}');
    }

    return TokenResponse.fromJson(jsonDecode(response.body));
  }

  /// Refresh access token
  Future<TokenResponse> refreshToken(String refreshToken) async {
    final response = await http.post(
      Uri.parse(_tokenUrl),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'client_id': clientId,
        'client_secret': clientSecret,
        'refresh_token': refreshToken,
        'grant_type': 'refresh_token',
      },
    );

    if (response.statusCode != 200) {
      throw GmailApiException('Token refresh failed: ${response.body}');
    }

    return TokenResponse.fromJson(jsonDecode(response.body));
  }

  /// Get user profile
  Future<Map<String, dynamic>> getUserProfile(String accessToken) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/users/me/profile'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode != 200) {
      throw GmailApiException('Profile fetch failed: ${response.body}');
    }

    return jsonDecode(response.body);
  }

  /// List messages with query
  Future<MessageListResponse> listMessages(
    String accessToken, {
    String? query,
    int maxResults = 100,
    String? pageToken,
    List<String>? labelIds,
  }) async {
    final params = <String, String>{
      'maxResults': maxResults.toString(),
    };
    if (query != null) params['q'] = query;
    if (pageToken != null) params['pageToken'] = pageToken;
    if (labelIds != null) params['labelIds'] = labelIds.join(',');

    final uri = Uri.parse('$_baseUrl/users/me/messages').replace(queryParameters: params);
    final response = await http.get(uri, headers: {'Authorization': 'Bearer $accessToken'});

    if (response.statusCode != 200) {
      throw GmailApiException('List messages failed: ${response.body}');
    }

    return MessageListResponse.fromJson(jsonDecode(response.body));
  }

  /// Get full message by ID
  Future<GmailMessage> getMessage(String accessToken, String messageId) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/users/me/messages/$messageId?format=full'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode != 200) {
      throw GmailApiException('Get message failed: ${response.body}');
    }

    return GmailMessage.fromJson(jsonDecode(response.body));
  }

  /// Get history since historyId
  Future<HistoryResponse> getHistory(
    String accessToken,
    String startHistoryId, {
    List<String>? labelIds,
    int maxResults = 100,
  }) async {
    final params = <String, String>{
      'startHistoryId': startHistoryId,
      'maxResults': maxResults.toString(),
    };
    if (labelIds != null) params['labelId'] = labelIds.join(',');

    final uri = Uri.parse('$_baseUrl/users/me/history').replace(queryParameters: params);
    final response = await http.get(uri, headers: {'Authorization': 'Bearer $accessToken'});

    if (response.statusCode != 200) {
      throw GmailApiException('Get history failed: ${response.body}');
    }

    return HistoryResponse.fromJson(jsonDecode(response.body));
  }

  /// Setup Pub/Sub watch for push notifications
  Future<WatchResponse> setupWatch(
    String accessToken,
    String topicName, {
    List<String>? labelIds,
  }) async {
    final body = {
      'topicName': topicName,
      'labelIds': labelIds ?? ['INBOX'],
    };

    final response = await http.post(
      Uri.parse('$_baseUrl/users/me/watch'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) {
      throw GmailApiException('Setup watch failed: ${response.body}');
    }

    return WatchResponse.fromJson(jsonDecode(response.body));
  }

  /// Stop watching for push notifications
  Future<void> stopWatch(String accessToken) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/users/me/stop'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode != 204 && response.statusCode != 200) {
      throw GmailApiException('Stop watch failed: ${response.body}');
    }
  }
}

/// Token response from OAuth
class TokenResponse {
  final String accessToken;
  final String? refreshToken;
  final int expiresIn;
  final String tokenType;
  final String? scope;

  TokenResponse({
    required this.accessToken,
    this.refreshToken,
    required this.expiresIn,
    required this.tokenType,
    this.scope,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      expiresIn: json['expires_in'],
      tokenType: json['token_type'],
      scope: json['scope'],
    );
  }

  DateTime get expiresAt => DateTime.now().add(Duration(seconds: expiresIn));
}

/// Message list response
class MessageListResponse {
  final List<MessageRef> messages;
  final String? nextPageToken;
  final int? resultSizeEstimate;

  MessageListResponse({
    required this.messages,
    this.nextPageToken,
    this.resultSizeEstimate,
  });

  factory MessageListResponse.fromJson(Map<String, dynamic> json) {
    return MessageListResponse(
      messages: (json['messages'] as List?)
              ?.map((m) => MessageRef.fromJson(m))
              .toList() ??
          [],
      nextPageToken: json['nextPageToken'],
      resultSizeEstimate: json['resultSizeEstimate'],
    );
  }
}

class MessageRef {
  final String id;
  final String threadId;

  MessageRef({required this.id, required this.threadId});

  factory MessageRef.fromJson(Map<String, dynamic> json) {
    return MessageRef(id: json['id'], threadId: json['threadId']);
  }
}

/// Full Gmail message
class GmailMessage {
  final String id;
  final String threadId;
  final List<String> labelIds;
  final String snippet;
  final MessagePayload payload;
  final int internalDate;
  final int sizeEstimate;

  GmailMessage({
    required this.id,
    required this.threadId,
    required this.labelIds,
    required this.snippet,
    required this.payload,
    required this.internalDate,
    required this.sizeEstimate,
  });

  factory GmailMessage.fromJson(Map<String, dynamic> json) {
    return GmailMessage(
      id: json['id'],
      threadId: json['threadId'],
      labelIds: List<String>.from(json['labelIds'] ?? []),
      snippet: json['snippet'] ?? '',
      payload: MessagePayload.fromJson(json['payload']),
      internalDate: int.parse(json['internalDate'] ?? '0'),
      sizeEstimate: json['sizeEstimate'] ?? 0,
    );
  }

  String? getHeader(String name) {
    return payload.headers
        .where((h) => h.name.toLowerCase() == name.toLowerCase())
        .map((h) => h.value)
        .firstOrNull;
  }

  String get from => getHeader('From') ?? '';
  String get to => getHeader('To') ?? '';
  String get subject => getHeader('Subject') ?? '';
  String get date => getHeader('Date') ?? '';

  DateTime get receivedAt => DateTime.fromMillisecondsSinceEpoch(internalDate);
}

class MessagePayload {
  final String? mimeType;
  final List<MessageHeader> headers;
  final MessageBody? body;
  final List<MessagePayload> parts;

  MessagePayload({
    this.mimeType,
    required this.headers,
    this.body,
    required this.parts,
  });

  factory MessagePayload.fromJson(Map<String, dynamic> json) {
    return MessagePayload(
      mimeType: json['mimeType'],
      headers: (json['headers'] as List?)
              ?.map((h) => MessageHeader.fromJson(h))
              .toList() ??
          [],
      body: json['body'] != null ? MessageBody.fromJson(json['body']) : null,
      parts: (json['parts'] as List?)
              ?.map((p) => MessagePayload.fromJson(p))
              .toList() ??
          [],
    );
  }
}

class MessageHeader {
  final String name;
  final String value;

  MessageHeader({required this.name, required this.value});

  factory MessageHeader.fromJson(Map<String, dynamic> json) {
    return MessageHeader(name: json['name'], value: json['value']);
  }
}

class MessageBody {
  final String? attachmentId;
  final int size;
  final String? data;

  MessageBody({this.attachmentId, required this.size, this.data});

  factory MessageBody.fromJson(Map<String, dynamic> json) {
    return MessageBody(
      attachmentId: json['attachmentId'],
      size: json['size'] ?? 0,
      data: json['data'],
    );
  }

  String? get decodedData {
    if (data == null) return null;
    try {
      return utf8.decode(base64Url.decode(data!));
    } catch (_) {
      return null;
    }
  }
}

/// History response
class HistoryResponse {
  final List<HistoryRecord> history;
  final String? nextPageToken;
  final String? historyId;

  HistoryResponse({
    required this.history,
    this.nextPageToken,
    this.historyId,
  });

  factory HistoryResponse.fromJson(Map<String, dynamic> json) {
    return HistoryResponse(
      history: (json['history'] as List?)
              ?.map((h) => HistoryRecord.fromJson(h))
              .toList() ??
          [],
      nextPageToken: json['nextPageToken'],
      historyId: json['historyId'],
    );
  }
}

class HistoryRecord {
  final String id;
  final List<MessageRef> messagesAdded;
  final List<MessageRef> messagesDeleted;
  final List<LabelChange> labelsAdded;
  final List<LabelChange> labelsRemoved;

  HistoryRecord({
    required this.id,
    required this.messagesAdded,
    required this.messagesDeleted,
    required this.labelsAdded,
    required this.labelsRemoved,
  });

  factory HistoryRecord.fromJson(Map<String, dynamic> json) {
    return HistoryRecord(
      id: json['id'],
      messagesAdded: (json['messagesAdded'] as List?)
              ?.map((m) => MessageRef.fromJson(m['message']))
              .toList() ??
          [],
      messagesDeleted: (json['messagesDeleted'] as List?)
              ?.map((m) => MessageRef.fromJson(m['message']))
              .toList() ??
          [],
      labelsAdded: (json['labelsAdded'] as List?)
              ?.map((l) => LabelChange.fromJson(l))
              .toList() ??
          [],
      labelsRemoved: (json['labelsRemoved'] as List?)
              ?.map((l) => LabelChange.fromJson(l))
              .toList() ??
          [],
    );
  }
}

class LabelChange {
  final MessageRef message;
  final List<String> labelIds;

  LabelChange({required this.message, required this.labelIds});

  factory LabelChange.fromJson(Map<String, dynamic> json) {
    return LabelChange(
      message: MessageRef.fromJson(json['message']),
      labelIds: List<String>.from(json['labelIds'] ?? []),
    );
  }
}

/// Watch response
class WatchResponse {
  final String historyId;
  final int expiration;

  WatchResponse({required this.historyId, required this.expiration});

  factory WatchResponse.fromJson(Map<String, dynamic> json) {
    return WatchResponse(
      historyId: json['historyId'],
      expiration: int.parse(json['expiration']),
    );
  }
}

/// Gmail API exception
class GmailApiException implements Exception {
  final String message;
  GmailApiException(this.message);

  @override
  String toString() => 'GmailApiException: $message';
}

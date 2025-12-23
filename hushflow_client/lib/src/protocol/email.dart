/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Email extends _i1.SerializableEntity {
  Email._({
    this.id,
    required this.userId,
    required this.gmailId,
    this.threadId,
    required this.sender,
    required this.senderEmail,
    required this.subject,
    this.snippet,
    this.bodyPlain,
    this.bodyHtml,
    required this.receivedAt,
    required this.isRead,
    required this.isSubscription,
    required this.priorityScore,
    this.labels,
    this.category,
    required this.hasImages,
    this.valuableImageUrl,
    required this.createdAt,
  });

  factory Email({
    int? id,
    required int userId,
    required String gmailId,
    String? threadId,
    required String sender,
    required String senderEmail,
    required String subject,
    String? snippet,
    String? bodyPlain,
    String? bodyHtml,
    required DateTime receivedAt,
    required bool isRead,
    required bool isSubscription,
    required double priorityScore,
    List<String>? labels,
    String? category,
    required bool hasImages,
    String? valuableImageUrl,
    required DateTime createdAt,
  }) = _EmailImpl;

  factory Email.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Email(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      gmailId: serializationManager
          .deserialize<String>(jsonSerialization['gmailId']),
      threadId: serializationManager
          .deserialize<String?>(jsonSerialization['threadId']),
      sender:
          serializationManager.deserialize<String>(jsonSerialization['sender']),
      senderEmail: serializationManager
          .deserialize<String>(jsonSerialization['senderEmail']),
      subject: serializationManager
          .deserialize<String>(jsonSerialization['subject']),
      snippet: serializationManager
          .deserialize<String?>(jsonSerialization['snippet']),
      bodyPlain: serializationManager
          .deserialize<String?>(jsonSerialization['bodyPlain']),
      bodyHtml: serializationManager
          .deserialize<String?>(jsonSerialization['bodyHtml']),
      receivedAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['receivedAt']),
      isRead:
          serializationManager.deserialize<bool>(jsonSerialization['isRead']),
      isSubscription: serializationManager
          .deserialize<bool>(jsonSerialization['isSubscription']),
      priorityScore: serializationManager
          .deserialize<double>(jsonSerialization['priorityScore']),
      labels: serializationManager
          .deserialize<List<String>?>(jsonSerialization['labels']),
      category: serializationManager
          .deserialize<String?>(jsonSerialization['category']),
      hasImages: serializationManager
          .deserialize<bool>(jsonSerialization['hasImages']),
      valuableImageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['valuableImageUrl']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  String gmailId;

  String? threadId;

  String sender;

  String senderEmail;

  String subject;

  String? snippet;

  String? bodyPlain;

  String? bodyHtml;

  DateTime receivedAt;

  bool isRead;

  bool isSubscription;

  double priorityScore;

  List<String>? labels;

  String? category;

  bool hasImages;

  String? valuableImageUrl;

  DateTime createdAt;

  Email copyWith({
    int? id,
    int? userId,
    String? gmailId,
    String? threadId,
    String? sender,
    String? senderEmail,
    String? subject,
    String? snippet,
    String? bodyPlain,
    String? bodyHtml,
    DateTime? receivedAt,
    bool? isRead,
    bool? isSubscription,
    double? priorityScore,
    List<String>? labels,
    String? category,
    bool? hasImages,
    String? valuableImageUrl,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'gmailId': gmailId,
      if (threadId != null) 'threadId': threadId,
      'sender': sender,
      'senderEmail': senderEmail,
      'subject': subject,
      if (snippet != null) 'snippet': snippet,
      if (bodyPlain != null) 'bodyPlain': bodyPlain,
      if (bodyHtml != null) 'bodyHtml': bodyHtml,
      'receivedAt': receivedAt.toJson(),
      'isRead': isRead,
      'isSubscription': isSubscription,
      'priorityScore': priorityScore,
      if (labels != null) 'labels': labels?.toJson(),
      if (category != null) 'category': category,
      'hasImages': hasImages,
      if (valuableImageUrl != null) 'valuableImageUrl': valuableImageUrl,
      'createdAt': createdAt.toJson(),
    };
  }
}

class _Undefined {}

class _EmailImpl extends Email {
  _EmailImpl({
    int? id,
    required int userId,
    required String gmailId,
    String? threadId,
    required String sender,
    required String senderEmail,
    required String subject,
    String? snippet,
    String? bodyPlain,
    String? bodyHtml,
    required DateTime receivedAt,
    required bool isRead,
    required bool isSubscription,
    required double priorityScore,
    List<String>? labels,
    String? category,
    required bool hasImages,
    String? valuableImageUrl,
    required DateTime createdAt,
  }) : super._(
          id: id,
          userId: userId,
          gmailId: gmailId,
          threadId: threadId,
          sender: sender,
          senderEmail: senderEmail,
          subject: subject,
          snippet: snippet,
          bodyPlain: bodyPlain,
          bodyHtml: bodyHtml,
          receivedAt: receivedAt,
          isRead: isRead,
          isSubscription: isSubscription,
          priorityScore: priorityScore,
          labels: labels,
          category: category,
          hasImages: hasImages,
          valuableImageUrl: valuableImageUrl,
          createdAt: createdAt,
        );

  @override
  Email copyWith({
    Object? id = _Undefined,
    int? userId,
    String? gmailId,
    Object? threadId = _Undefined,
    String? sender,
    String? senderEmail,
    String? subject,
    Object? snippet = _Undefined,
    Object? bodyPlain = _Undefined,
    Object? bodyHtml = _Undefined,
    DateTime? receivedAt,
    bool? isRead,
    bool? isSubscription,
    double? priorityScore,
    Object? labels = _Undefined,
    Object? category = _Undefined,
    bool? hasImages,
    Object? valuableImageUrl = _Undefined,
    DateTime? createdAt,
  }) {
    return Email(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      gmailId: gmailId ?? this.gmailId,
      threadId: threadId is String? ? threadId : this.threadId,
      sender: sender ?? this.sender,
      senderEmail: senderEmail ?? this.senderEmail,
      subject: subject ?? this.subject,
      snippet: snippet is String? ? snippet : this.snippet,
      bodyPlain: bodyPlain is String? ? bodyPlain : this.bodyPlain,
      bodyHtml: bodyHtml is String? ? bodyHtml : this.bodyHtml,
      receivedAt: receivedAt ?? this.receivedAt,
      isRead: isRead ?? this.isRead,
      isSubscription: isSubscription ?? this.isSubscription,
      priorityScore: priorityScore ?? this.priorityScore,
      labels: labels is List<String>? ? labels : this.labels?.clone(),
      category: category is String? ? category : this.category,
      hasImages: hasImages ?? this.hasImages,
      valuableImageUrl: valuableImageUrl is String?
          ? valuableImageUrl
          : this.valuableImageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

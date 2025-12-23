/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class UnsubscribeQueue extends _i1.SerializableEntity {
  UnsubscribeQueue._({
    this.id,
    required this.userId,
    required this.emailId,
    required this.senderEmail,
    this.unsubscribeLink,
    required this.status,
    this.action,
    this.processedAt,
    required this.createdAt,
  });

  factory UnsubscribeQueue({
    int? id,
    required int userId,
    required int emailId,
    required String senderEmail,
    String? unsubscribeLink,
    required String status,
    String? action,
    DateTime? processedAt,
    required DateTime createdAt,
  }) = _UnsubscribeQueueImpl;

  factory UnsubscribeQueue.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return UnsubscribeQueue(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      emailId:
          serializationManager.deserialize<int>(jsonSerialization['emailId']),
      senderEmail: serializationManager
          .deserialize<String>(jsonSerialization['senderEmail']),
      unsubscribeLink: serializationManager
          .deserialize<String?>(jsonSerialization['unsubscribeLink']),
      status:
          serializationManager.deserialize<String>(jsonSerialization['status']),
      action: serializationManager
          .deserialize<String?>(jsonSerialization['action']),
      processedAt: serializationManager
          .deserialize<DateTime?>(jsonSerialization['processedAt']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  int emailId;

  String senderEmail;

  String? unsubscribeLink;

  String status;

  String? action;

  DateTime? processedAt;

  DateTime createdAt;

  UnsubscribeQueue copyWith({
    int? id,
    int? userId,
    int? emailId,
    String? senderEmail,
    String? unsubscribeLink,
    String? status,
    String? action,
    DateTime? processedAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'emailId': emailId,
      'senderEmail': senderEmail,
      if (unsubscribeLink != null) 'unsubscribeLink': unsubscribeLink,
      'status': status,
      if (action != null) 'action': action,
      if (processedAt != null) 'processedAt': processedAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }
}

class _Undefined {}

class _UnsubscribeQueueImpl extends UnsubscribeQueue {
  _UnsubscribeQueueImpl({
    int? id,
    required int userId,
    required int emailId,
    required String senderEmail,
    String? unsubscribeLink,
    required String status,
    String? action,
    DateTime? processedAt,
    required DateTime createdAt,
  }) : super._(
          id: id,
          userId: userId,
          emailId: emailId,
          senderEmail: senderEmail,
          unsubscribeLink: unsubscribeLink,
          status: status,
          action: action,
          processedAt: processedAt,
          createdAt: createdAt,
        );

  @override
  UnsubscribeQueue copyWith({
    Object? id = _Undefined,
    int? userId,
    int? emailId,
    String? senderEmail,
    Object? unsubscribeLink = _Undefined,
    String? status,
    Object? action = _Undefined,
    Object? processedAt = _Undefined,
    DateTime? createdAt,
  }) {
    return UnsubscribeQueue(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      emailId: emailId ?? this.emailId,
      senderEmail: senderEmail ?? this.senderEmail,
      unsubscribeLink:
          unsubscribeLink is String? ? unsubscribeLink : this.unsubscribeLink,
      status: status ?? this.status,
      action: action is String? ? action : this.action,
      processedAt: processedAt is DateTime? ? processedAt : this.processedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

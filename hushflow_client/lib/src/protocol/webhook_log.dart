/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class WebhookLog extends _i1.SerializableEntity {
  WebhookLog._({
    this.id,
    required this.messageId,
    this.historyId,
    required this.payload,
    required this.status,
    this.error,
    required this.receivedAt,
    this.processedAt,
  });

  factory WebhookLog({
    int? id,
    required String messageId,
    String? historyId,
    required String payload,
    required String status,
    String? error,
    required DateTime receivedAt,
    DateTime? processedAt,
  }) = _WebhookLogImpl;

  factory WebhookLog.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return WebhookLog(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      messageId: serializationManager
          .deserialize<String>(jsonSerialization['messageId']),
      historyId: serializationManager
          .deserialize<String?>(jsonSerialization['historyId']),
      payload: serializationManager
          .deserialize<String>(jsonSerialization['payload']),
      status:
          serializationManager.deserialize<String>(jsonSerialization['status']),
      error:
          serializationManager.deserialize<String?>(jsonSerialization['error']),
      receivedAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['receivedAt']),
      processedAt: serializationManager
          .deserialize<DateTime?>(jsonSerialization['processedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String messageId;

  String? historyId;

  String payload;

  String status;

  String? error;

  DateTime receivedAt;

  DateTime? processedAt;

  WebhookLog copyWith({
    int? id,
    String? messageId,
    String? historyId,
    String? payload,
    String? status,
    String? error,
    DateTime? receivedAt,
    DateTime? processedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'messageId': messageId,
      if (historyId != null) 'historyId': historyId,
      'payload': payload,
      'status': status,
      if (error != null) 'error': error,
      'receivedAt': receivedAt.toJson(),
      if (processedAt != null) 'processedAt': processedAt?.toJson(),
    };
  }
}

class _Undefined {}

class _WebhookLogImpl extends WebhookLog {
  _WebhookLogImpl({
    int? id,
    required String messageId,
    String? historyId,
    required String payload,
    required String status,
    String? error,
    required DateTime receivedAt,
    DateTime? processedAt,
  }) : super._(
          id: id,
          messageId: messageId,
          historyId: historyId,
          payload: payload,
          status: status,
          error: error,
          receivedAt: receivedAt,
          processedAt: processedAt,
        );

  @override
  WebhookLog copyWith({
    Object? id = _Undefined,
    String? messageId,
    Object? historyId = _Undefined,
    String? payload,
    String? status,
    Object? error = _Undefined,
    DateTime? receivedAt,
    Object? processedAt = _Undefined,
  }) {
    return WebhookLog(
      id: id is int? ? id : this.id,
      messageId: messageId ?? this.messageId,
      historyId: historyId is String? ? historyId : this.historyId,
      payload: payload ?? this.payload,
      status: status ?? this.status,
      error: error is String? ? error : this.error,
      receivedAt: receivedAt ?? this.receivedAt,
      processedAt: processedAt is DateTime? ? processedAt : this.processedAt,
    );
  }
}

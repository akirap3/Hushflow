/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class SummaryItem extends _i1.SerializableEntity {
  SummaryItem._({
    this.id,
    required this.summaryId,
    required this.emailId,
    required this.sender,
    required this.subject,
    required this.summaryText,
    this.imageUrl,
    required this.priorityScore,
    required this.order,
  });

  factory SummaryItem({
    int? id,
    required int summaryId,
    required int emailId,
    required String sender,
    required String subject,
    required String summaryText,
    String? imageUrl,
    required double priorityScore,
    required int order,
  }) = _SummaryItemImpl;

  factory SummaryItem.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return SummaryItem(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      summaryId:
          serializationManager.deserialize<int>(jsonSerialization['summaryId']),
      emailId:
          serializationManager.deserialize<int>(jsonSerialization['emailId']),
      sender:
          serializationManager.deserialize<String>(jsonSerialization['sender']),
      subject: serializationManager
          .deserialize<String>(jsonSerialization['subject']),
      summaryText: serializationManager
          .deserialize<String>(jsonSerialization['summaryText']),
      imageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['imageUrl']),
      priorityScore: serializationManager
          .deserialize<double>(jsonSerialization['priorityScore']),
      order: serializationManager.deserialize<int>(jsonSerialization['order']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int summaryId;

  int emailId;

  String sender;

  String subject;

  String summaryText;

  String? imageUrl;

  double priorityScore;

  int order;

  SummaryItem copyWith({
    int? id,
    int? summaryId,
    int? emailId,
    String? sender,
    String? subject,
    String? summaryText,
    String? imageUrl,
    double? priorityScore,
    int? order,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'summaryId': summaryId,
      'emailId': emailId,
      'sender': sender,
      'subject': subject,
      'summaryText': summaryText,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'priorityScore': priorityScore,
      'order': order,
    };
  }
}

class _Undefined {}

class _SummaryItemImpl extends SummaryItem {
  _SummaryItemImpl({
    int? id,
    required int summaryId,
    required int emailId,
    required String sender,
    required String subject,
    required String summaryText,
    String? imageUrl,
    required double priorityScore,
    required int order,
  }) : super._(
          id: id,
          summaryId: summaryId,
          emailId: emailId,
          sender: sender,
          subject: subject,
          summaryText: summaryText,
          imageUrl: imageUrl,
          priorityScore: priorityScore,
          order: order,
        );

  @override
  SummaryItem copyWith({
    Object? id = _Undefined,
    int? summaryId,
    int? emailId,
    String? sender,
    String? subject,
    String? summaryText,
    Object? imageUrl = _Undefined,
    double? priorityScore,
    int? order,
  }) {
    return SummaryItem(
      id: id is int? ? id : this.id,
      summaryId: summaryId ?? this.summaryId,
      emailId: emailId ?? this.emailId,
      sender: sender ?? this.sender,
      subject: subject ?? this.subject,
      summaryText: summaryText ?? this.summaryText,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
      priorityScore: priorityScore ?? this.priorityScore,
      order: order ?? this.order,
    );
  }
}

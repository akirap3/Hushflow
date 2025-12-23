/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class EmailFeature extends _i1.SerializableEntity {
  EmailFeature._({
    this.id,
    required this.emailId,
    required this.userId,
    required this.senderFrequency,
    required this.senderOpenRate,
    this.keywordVector,
    required this.hasUnsubscribeLink,
    required this.contentLength,
    required this.imageCount,
    required this.linkCount,
    required this.hourReceived,
    required this.dayOfWeek,
    this.wasOpened,
    this.wasClicked,
    this.interactionTime,
  });

  factory EmailFeature({
    int? id,
    required int emailId,
    required int userId,
    required int senderFrequency,
    required double senderOpenRate,
    String? keywordVector,
    required bool hasUnsubscribeLink,
    required int contentLength,
    required int imageCount,
    required int linkCount,
    required int hourReceived,
    required int dayOfWeek,
    bool? wasOpened,
    bool? wasClicked,
    int? interactionTime,
  }) = _EmailFeatureImpl;

  factory EmailFeature.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return EmailFeature(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      emailId:
          serializationManager.deserialize<int>(jsonSerialization['emailId']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      senderFrequency: serializationManager
          .deserialize<int>(jsonSerialization['senderFrequency']),
      senderOpenRate: serializationManager
          .deserialize<double>(jsonSerialization['senderOpenRate']),
      keywordVector: serializationManager
          .deserialize<String?>(jsonSerialization['keywordVector']),
      hasUnsubscribeLink: serializationManager
          .deserialize<bool>(jsonSerialization['hasUnsubscribeLink']),
      contentLength: serializationManager
          .deserialize<int>(jsonSerialization['contentLength']),
      imageCount: serializationManager
          .deserialize<int>(jsonSerialization['imageCount']),
      linkCount:
          serializationManager.deserialize<int>(jsonSerialization['linkCount']),
      hourReceived: serializationManager
          .deserialize<int>(jsonSerialization['hourReceived']),
      dayOfWeek:
          serializationManager.deserialize<int>(jsonSerialization['dayOfWeek']),
      wasOpened: serializationManager
          .deserialize<bool?>(jsonSerialization['wasOpened']),
      wasClicked: serializationManager
          .deserialize<bool?>(jsonSerialization['wasClicked']),
      interactionTime: serializationManager
          .deserialize<int?>(jsonSerialization['interactionTime']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int emailId;

  int userId;

  int senderFrequency;

  double senderOpenRate;

  String? keywordVector;

  bool hasUnsubscribeLink;

  int contentLength;

  int imageCount;

  int linkCount;

  int hourReceived;

  int dayOfWeek;

  bool? wasOpened;

  bool? wasClicked;

  int? interactionTime;

  EmailFeature copyWith({
    int? id,
    int? emailId,
    int? userId,
    int? senderFrequency,
    double? senderOpenRate,
    String? keywordVector,
    bool? hasUnsubscribeLink,
    int? contentLength,
    int? imageCount,
    int? linkCount,
    int? hourReceived,
    int? dayOfWeek,
    bool? wasOpened,
    bool? wasClicked,
    int? interactionTime,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'emailId': emailId,
      'userId': userId,
      'senderFrequency': senderFrequency,
      'senderOpenRate': senderOpenRate,
      if (keywordVector != null) 'keywordVector': keywordVector,
      'hasUnsubscribeLink': hasUnsubscribeLink,
      'contentLength': contentLength,
      'imageCount': imageCount,
      'linkCount': linkCount,
      'hourReceived': hourReceived,
      'dayOfWeek': dayOfWeek,
      if (wasOpened != null) 'wasOpened': wasOpened,
      if (wasClicked != null) 'wasClicked': wasClicked,
      if (interactionTime != null) 'interactionTime': interactionTime,
    };
  }
}

class _Undefined {}

class _EmailFeatureImpl extends EmailFeature {
  _EmailFeatureImpl({
    int? id,
    required int emailId,
    required int userId,
    required int senderFrequency,
    required double senderOpenRate,
    String? keywordVector,
    required bool hasUnsubscribeLink,
    required int contentLength,
    required int imageCount,
    required int linkCount,
    required int hourReceived,
    required int dayOfWeek,
    bool? wasOpened,
    bool? wasClicked,
    int? interactionTime,
  }) : super._(
          id: id,
          emailId: emailId,
          userId: userId,
          senderFrequency: senderFrequency,
          senderOpenRate: senderOpenRate,
          keywordVector: keywordVector,
          hasUnsubscribeLink: hasUnsubscribeLink,
          contentLength: contentLength,
          imageCount: imageCount,
          linkCount: linkCount,
          hourReceived: hourReceived,
          dayOfWeek: dayOfWeek,
          wasOpened: wasOpened,
          wasClicked: wasClicked,
          interactionTime: interactionTime,
        );

  @override
  EmailFeature copyWith({
    Object? id = _Undefined,
    int? emailId,
    int? userId,
    int? senderFrequency,
    double? senderOpenRate,
    Object? keywordVector = _Undefined,
    bool? hasUnsubscribeLink,
    int? contentLength,
    int? imageCount,
    int? linkCount,
    int? hourReceived,
    int? dayOfWeek,
    Object? wasOpened = _Undefined,
    Object? wasClicked = _Undefined,
    Object? interactionTime = _Undefined,
  }) {
    return EmailFeature(
      id: id is int? ? id : this.id,
      emailId: emailId ?? this.emailId,
      userId: userId ?? this.userId,
      senderFrequency: senderFrequency ?? this.senderFrequency,
      senderOpenRate: senderOpenRate ?? this.senderOpenRate,
      keywordVector:
          keywordVector is String? ? keywordVector : this.keywordVector,
      hasUnsubscribeLink: hasUnsubscribeLink ?? this.hasUnsubscribeLink,
      contentLength: contentLength ?? this.contentLength,
      imageCount: imageCount ?? this.imageCount,
      linkCount: linkCount ?? this.linkCount,
      hourReceived: hourReceived ?? this.hourReceived,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      wasOpened: wasOpened is bool? ? wasOpened : this.wasOpened,
      wasClicked: wasClicked is bool? ? wasClicked : this.wasClicked,
      interactionTime:
          interactionTime is int? ? interactionTime : this.interactionTime,
    );
  }
}

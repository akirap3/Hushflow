/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Summary extends _i1.SerializableEntity {
  Summary._({
    this.id,
    required this.userId,
    required this.title,
    required this.content,
    this.audioUrl,
    required this.emailCount,
    required this.generatedAt,
    required this.periodStart,
    required this.periodEnd,
    required this.isRead,
  });

  factory Summary({
    int? id,
    required int userId,
    required String title,
    required String content,
    String? audioUrl,
    required int emailCount,
    required DateTime generatedAt,
    required DateTime periodStart,
    required DateTime periodEnd,
    required bool isRead,
  }) = _SummaryImpl;

  factory Summary.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Summary(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      content: serializationManager
          .deserialize<String>(jsonSerialization['content']),
      audioUrl: serializationManager
          .deserialize<String?>(jsonSerialization['audioUrl']),
      emailCount: serializationManager
          .deserialize<int>(jsonSerialization['emailCount']),
      generatedAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['generatedAt']),
      periodStart: serializationManager
          .deserialize<DateTime>(jsonSerialization['periodStart']),
      periodEnd: serializationManager
          .deserialize<DateTime>(jsonSerialization['periodEnd']),
      isRead:
          serializationManager.deserialize<bool>(jsonSerialization['isRead']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  String title;

  String content;

  String? audioUrl;

  int emailCount;

  DateTime generatedAt;

  DateTime periodStart;

  DateTime periodEnd;

  bool isRead;

  Summary copyWith({
    int? id,
    int? userId,
    String? title,
    String? content,
    String? audioUrl,
    int? emailCount,
    DateTime? generatedAt,
    DateTime? periodStart,
    DateTime? periodEnd,
    bool? isRead,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'title': title,
      'content': content,
      if (audioUrl != null) 'audioUrl': audioUrl,
      'emailCount': emailCount,
      'generatedAt': generatedAt.toJson(),
      'periodStart': periodStart.toJson(),
      'periodEnd': periodEnd.toJson(),
      'isRead': isRead,
    };
  }
}

class _Undefined {}

class _SummaryImpl extends Summary {
  _SummaryImpl({
    int? id,
    required int userId,
    required String title,
    required String content,
    String? audioUrl,
    required int emailCount,
    required DateTime generatedAt,
    required DateTime periodStart,
    required DateTime periodEnd,
    required bool isRead,
  }) : super._(
          id: id,
          userId: userId,
          title: title,
          content: content,
          audioUrl: audioUrl,
          emailCount: emailCount,
          generatedAt: generatedAt,
          periodStart: periodStart,
          periodEnd: periodEnd,
          isRead: isRead,
        );

  @override
  Summary copyWith({
    Object? id = _Undefined,
    int? userId,
    String? title,
    String? content,
    Object? audioUrl = _Undefined,
    int? emailCount,
    DateTime? generatedAt,
    DateTime? periodStart,
    DateTime? periodEnd,
    bool? isRead,
  }) {
    return Summary(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      content: content ?? this.content,
      audioUrl: audioUrl is String? ? audioUrl : this.audioUrl,
      emailCount: emailCount ?? this.emailCount,
      generatedAt: generatedAt ?? this.generatedAt,
      periodStart: periodStart ?? this.periodStart,
      periodEnd: periodEnd ?? this.periodEnd,
      isRead: isRead ?? this.isRead,
    );
  }
}

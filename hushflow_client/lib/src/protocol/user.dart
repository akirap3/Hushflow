/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class User extends _i1.SerializableEntity {
  User._({
    this.id,
    required this.googleId,
    required this.email,
    this.accessToken,
    this.refreshToken,
    this.tokenExpiresAt,
    this.historyId,
    this.summarySchedule,
    this.timezone,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User({
    int? id,
    required String googleId,
    required String email,
    String? accessToken,
    String? refreshToken,
    DateTime? tokenExpiresAt,
    String? historyId,
    String? summarySchedule,
    String? timezone,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserImpl;

  factory User.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return User(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      googleId: serializationManager
          .deserialize<String>(jsonSerialization['googleId']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      accessToken: serializationManager
          .deserialize<String?>(jsonSerialization['accessToken']),
      refreshToken: serializationManager
          .deserialize<String?>(jsonSerialization['refreshToken']),
      tokenExpiresAt: serializationManager
          .deserialize<DateTime?>(jsonSerialization['tokenExpiresAt']),
      historyId: serializationManager
          .deserialize<String?>(jsonSerialization['historyId']),
      summarySchedule: serializationManager
          .deserialize<String?>(jsonSerialization['summarySchedule']),
      timezone: serializationManager
          .deserialize<String?>(jsonSerialization['timezone']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
      updatedAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String googleId;

  String email;

  String? accessToken;

  String? refreshToken;

  DateTime? tokenExpiresAt;

  String? historyId;

  String? summarySchedule;

  String? timezone;

  DateTime createdAt;

  DateTime updatedAt;

  User copyWith({
    int? id,
    String? googleId,
    String? email,
    String? accessToken,
    String? refreshToken,
    DateTime? tokenExpiresAt,
    String? historyId,
    String? summarySchedule,
    String? timezone,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'googleId': googleId,
      'email': email,
      if (accessToken != null) 'accessToken': accessToken,
      if (refreshToken != null) 'refreshToken': refreshToken,
      if (tokenExpiresAt != null) 'tokenExpiresAt': tokenExpiresAt?.toJson(),
      if (historyId != null) 'historyId': historyId,
      if (summarySchedule != null) 'summarySchedule': summarySchedule,
      if (timezone != null) 'timezone': timezone,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String googleId,
    required String email,
    String? accessToken,
    String? refreshToken,
    DateTime? tokenExpiresAt,
    String? historyId,
    String? summarySchedule,
    String? timezone,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          googleId: googleId,
          email: email,
          accessToken: accessToken,
          refreshToken: refreshToken,
          tokenExpiresAt: tokenExpiresAt,
          historyId: historyId,
          summarySchedule: summarySchedule,
          timezone: timezone,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  User copyWith({
    Object? id = _Undefined,
    String? googleId,
    String? email,
    Object? accessToken = _Undefined,
    Object? refreshToken = _Undefined,
    Object? tokenExpiresAt = _Undefined,
    Object? historyId = _Undefined,
    Object? summarySchedule = _Undefined,
    Object? timezone = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id is int? ? id : this.id,
      googleId: googleId ?? this.googleId,
      email: email ?? this.email,
      accessToken: accessToken is String? ? accessToken : this.accessToken,
      refreshToken: refreshToken is String? ? refreshToken : this.refreshToken,
      tokenExpiresAt:
          tokenExpiresAt is DateTime? ? tokenExpiresAt : this.tokenExpiresAt,
      historyId: historyId is String? ? historyId : this.historyId,
      summarySchedule:
          summarySchedule is String? ? summarySchedule : this.summarySchedule,
      timezone: timezone is String? ? timezone : this.timezone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

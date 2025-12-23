/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Exclusion extends _i1.SerializableEntity {
  Exclusion._({
    this.id,
    required this.userId,
    required this.type,
    required this.value,
    this.reason,
    required this.createdAt,
  });

  factory Exclusion({
    int? id,
    required int userId,
    required String type,
    required String value,
    String? reason,
    required DateTime createdAt,
  }) = _ExclusionImpl;

  factory Exclusion.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Exclusion(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      type: serializationManager.deserialize<String>(jsonSerialization['type']),
      value:
          serializationManager.deserialize<String>(jsonSerialization['value']),
      reason: serializationManager
          .deserialize<String?>(jsonSerialization['reason']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  String type;

  String value;

  String? reason;

  DateTime createdAt;

  Exclusion copyWith({
    int? id,
    int? userId,
    String? type,
    String? value,
    String? reason,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'type': type,
      'value': value,
      if (reason != null) 'reason': reason,
      'createdAt': createdAt.toJson(),
    };
  }
}

class _Undefined {}

class _ExclusionImpl extends Exclusion {
  _ExclusionImpl({
    int? id,
    required int userId,
    required String type,
    required String value,
    String? reason,
    required DateTime createdAt,
  }) : super._(
          id: id,
          userId: userId,
          type: type,
          value: value,
          reason: reason,
          createdAt: createdAt,
        );

  @override
  Exclusion copyWith({
    Object? id = _Undefined,
    int? userId,
    String? type,
    String? value,
    Object? reason = _Undefined,
    DateTime? createdAt,
  }) {
    return Exclusion(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      value: value ?? this.value,
      reason: reason is String? ? reason : this.reason,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

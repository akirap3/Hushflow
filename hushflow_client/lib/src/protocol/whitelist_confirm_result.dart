/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class WhitelistConfirmResult extends _i1.SerializableEntity {
  WhitelistConfirmResult._({
    required this.success,
    required this.created,
    required this.updated,
    required this.totalWhitelisted,
  });

  factory WhitelistConfirmResult({
    required bool success,
    required int created,
    required int updated,
    required int totalWhitelisted,
  }) = _WhitelistConfirmResultImpl;

  factory WhitelistConfirmResult.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return WhitelistConfirmResult(
      success:
          serializationManager.deserialize<bool>(jsonSerialization['success']),
      created:
          serializationManager.deserialize<int>(jsonSerialization['created']),
      updated:
          serializationManager.deserialize<int>(jsonSerialization['updated']),
      totalWhitelisted: serializationManager
          .deserialize<int>(jsonSerialization['totalWhitelisted']),
    );
  }

  bool success;

  int created;

  int updated;

  int totalWhitelisted;

  WhitelistConfirmResult copyWith({
    bool? success,
    int? created,
    int? updated,
    int? totalWhitelisted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'created': created,
      'updated': updated,
      'totalWhitelisted': totalWhitelisted,
    };
  }
}

class _WhitelistConfirmResultImpl extends WhitelistConfirmResult {
  _WhitelistConfirmResultImpl({
    required bool success,
    required int created,
    required int updated,
    required int totalWhitelisted,
  }) : super._(
          success: success,
          created: created,
          updated: updated,
          totalWhitelisted: totalWhitelisted,
        );

  @override
  WhitelistConfirmResult copyWith({
    bool? success,
    int? created,
    int? updated,
    int? totalWhitelisted,
  }) {
    return WhitelistConfirmResult(
      success: success ?? this.success,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      totalWhitelisted: totalWhitelisted ?? this.totalWhitelisted,
    );
  }
}

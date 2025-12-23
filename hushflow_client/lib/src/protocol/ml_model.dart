/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class MlModel extends _i1.SerializableEntity {
  MlModel._({
    this.id,
    required this.userId,
    required this.version,
    required this.modelPath,
    required this.trainingSize,
    this.accuracy,
    required this.trainedAt,
    required this.isActive,
  });

  factory MlModel({
    int? id,
    required int userId,
    required int version,
    required String modelPath,
    required int trainingSize,
    double? accuracy,
    required DateTime trainedAt,
    required bool isActive,
  }) = _MlModelImpl;

  factory MlModel.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return MlModel(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      version:
          serializationManager.deserialize<int>(jsonSerialization['version']),
      modelPath: serializationManager
          .deserialize<String>(jsonSerialization['modelPath']),
      trainingSize: serializationManager
          .deserialize<int>(jsonSerialization['trainingSize']),
      accuracy: serializationManager
          .deserialize<double?>(jsonSerialization['accuracy']),
      trainedAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['trainedAt']),
      isActive:
          serializationManager.deserialize<bool>(jsonSerialization['isActive']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  int version;

  String modelPath;

  int trainingSize;

  double? accuracy;

  DateTime trainedAt;

  bool isActive;

  MlModel copyWith({
    int? id,
    int? userId,
    int? version,
    String? modelPath,
    int? trainingSize,
    double? accuracy,
    DateTime? trainedAt,
    bool? isActive,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'version': version,
      'modelPath': modelPath,
      'trainingSize': trainingSize,
      if (accuracy != null) 'accuracy': accuracy,
      'trainedAt': trainedAt.toJson(),
      'isActive': isActive,
    };
  }
}

class _Undefined {}

class _MlModelImpl extends MlModel {
  _MlModelImpl({
    int? id,
    required int userId,
    required int version,
    required String modelPath,
    required int trainingSize,
    double? accuracy,
    required DateTime trainedAt,
    required bool isActive,
  }) : super._(
          id: id,
          userId: userId,
          version: version,
          modelPath: modelPath,
          trainingSize: trainingSize,
          accuracy: accuracy,
          trainedAt: trainedAt,
          isActive: isActive,
        );

  @override
  MlModel copyWith({
    Object? id = _Undefined,
    int? userId,
    int? version,
    String? modelPath,
    int? trainingSize,
    Object? accuracy = _Undefined,
    DateTime? trainedAt,
    bool? isActive,
  }) {
    return MlModel(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      version: version ?? this.version,
      modelPath: modelPath ?? this.modelPath,
      trainingSize: trainingSize ?? this.trainingSize,
      accuracy: accuracy is double? ? accuracy : this.accuracy,
      trainedAt: trainedAt ?? this.trainedAt,
      isActive: isActive ?? this.isActive,
    );
  }
}

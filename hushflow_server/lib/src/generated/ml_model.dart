/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class MlModel extends _i1.TableRow {
  MlModel._({
    int? id,
    required this.userId,
    required this.version,
    required this.modelPath,
    required this.trainingSize,
    this.accuracy,
    required this.trainedAt,
    required this.isActive,
  }) : super(id);

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

  static final t = MlModelTable();

  static const db = MlModelRepository._();

  int userId;

  int version;

  String modelPath;

  int trainingSize;

  double? accuracy;

  DateTime trainedAt;

  bool isActive;

  @override
  _i1.Table get table => t;

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

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'userId': userId,
      'version': version,
      'modelPath': modelPath,
      'trainingSize': trainingSize,
      'accuracy': accuracy,
      'trainedAt': trainedAt,
      'isActive': isActive,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
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

  @override
  @Deprecated('Will be removed in 2.0.0')
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'userId':
        userId = value;
        return;
      case 'version':
        version = value;
        return;
      case 'modelPath':
        modelPath = value;
        return;
      case 'trainingSize':
        trainingSize = value;
        return;
      case 'accuracy':
        accuracy = value;
        return;
      case 'trainedAt':
        trainedAt = value;
        return;
      case 'isActive':
        isActive = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<MlModel>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MlModelTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<MlModel>(
      where: where != null ? where(MlModel.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findRow instead.')
  static Future<MlModel?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MlModelTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<MlModel>(
      where: where != null ? where(MlModel.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<MlModel?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<MlModel>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MlModelTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MlModel>(
      where: where(MlModel.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    MlModel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.update instead.')
  static Future<bool> update(
    _i1.Session session,
    MlModel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  @Deprecated(
      'Will be removed in 2.0.0. Use: db.insert instead. Important note: In db.insert, the object you pass in is no longer modified, instead a new copy with the added row is returned which contains the inserted id.')
  static Future<void> insert(
    _i1.Session session,
    MlModel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.count instead.')
  static Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MlModelTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MlModel>(
      where: where != null ? where(MlModel.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static MlModelInclude include() {
    return MlModelInclude._();
  }

  static MlModelIncludeList includeList({
    _i1.WhereExpressionBuilder<MlModelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MlModelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MlModelTable>? orderByList,
    MlModelInclude? include,
  }) {
    return MlModelIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MlModel.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MlModel.t),
      include: include,
    );
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

class MlModelTable extends _i1.Table {
  MlModelTable({super.tableRelation}) : super(tableName: 'ml_models') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    version = _i1.ColumnInt(
      'version',
      this,
    );
    modelPath = _i1.ColumnString(
      'modelPath',
      this,
    );
    trainingSize = _i1.ColumnInt(
      'trainingSize',
      this,
    );
    accuracy = _i1.ColumnDouble(
      'accuracy',
      this,
    );
    trainedAt = _i1.ColumnDateTime(
      'trainedAt',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnInt version;

  late final _i1.ColumnString modelPath;

  late final _i1.ColumnInt trainingSize;

  late final _i1.ColumnDouble accuracy;

  late final _i1.ColumnDateTime trainedAt;

  late final _i1.ColumnBool isActive;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        version,
        modelPath,
        trainingSize,
        accuracy,
        trainedAt,
        isActive,
      ];
}

@Deprecated('Use MlModelTable.t instead.')
MlModelTable tMlModel = MlModelTable();

class MlModelInclude extends _i1.IncludeObject {
  MlModelInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => MlModel.t;
}

class MlModelIncludeList extends _i1.IncludeList {
  MlModelIncludeList._({
    _i1.WhereExpressionBuilder<MlModelTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MlModel.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => MlModel.t;
}

class MlModelRepository {
  const MlModelRepository._();

  Future<List<MlModel>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MlModelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MlModelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MlModelTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<MlModel>(
      where: where?.call(MlModel.t),
      orderBy: orderBy?.call(MlModel.t),
      orderByList: orderByList?.call(MlModel.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<MlModel?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MlModelTable>? where,
    int? offset,
    _i1.OrderByBuilder<MlModelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MlModelTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<MlModel>(
      where: where?.call(MlModel.t),
      orderBy: orderBy?.call(MlModel.t),
      orderByList: orderByList?.call(MlModel.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<MlModel?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<MlModel>(
      id,
      transaction: transaction,
    );
  }

  Future<List<MlModel>> insert(
    _i1.Session session,
    List<MlModel> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<MlModel>(
      rows,
      transaction: transaction,
    );
  }

  Future<MlModel> insertRow(
    _i1.Session session,
    MlModel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<MlModel>(
      row,
      transaction: transaction,
    );
  }

  Future<List<MlModel>> update(
    _i1.Session session,
    List<MlModel> rows, {
    _i1.ColumnSelections<MlModelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<MlModel>(
      rows,
      columns: columns?.call(MlModel.t),
      transaction: transaction,
    );
  }

  Future<MlModel> updateRow(
    _i1.Session session,
    MlModel row, {
    _i1.ColumnSelections<MlModelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<MlModel>(
      row,
      columns: columns?.call(MlModel.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<MlModel> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<MlModel>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    MlModel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<MlModel>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MlModelTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<MlModel>(
      where: where(MlModel.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MlModelTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<MlModel>(
      where: where?.call(MlModel.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

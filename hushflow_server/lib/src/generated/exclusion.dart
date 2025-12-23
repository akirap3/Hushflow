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

abstract class Exclusion extends _i1.TableRow {
  Exclusion._({
    int? id,
    required this.userId,
    required this.type,
    required this.value,
    this.reason,
    required this.createdAt,
  }) : super(id);

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

  static final t = ExclusionTable();

  static const db = ExclusionRepository._();

  int userId;

  String type;

  String value;

  String? reason;

  DateTime createdAt;

  @override
  _i1.Table get table => t;

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

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'userId': userId,
      'type': type,
      'value': value,
      'reason': reason,
      'createdAt': createdAt,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'type': type,
      'value': value,
      if (reason != null) 'reason': reason,
      'createdAt': createdAt.toJson(),
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
      case 'type':
        type = value;
        return;
      case 'value':
        value = value;
        return;
      case 'reason':
        reason = value;
        return;
      case 'createdAt':
        createdAt = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<Exclusion>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExclusionTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Exclusion>(
      where: where != null ? where(Exclusion.t) : null,
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
  static Future<Exclusion?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExclusionTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Exclusion>(
      where: where != null ? where(Exclusion.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<Exclusion?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Exclusion>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ExclusionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Exclusion>(
      where: where(Exclusion.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    Exclusion row, {
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
    Exclusion row, {
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
    Exclusion row, {
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
    _i1.WhereExpressionBuilder<ExclusionTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Exclusion>(
      where: where != null ? where(Exclusion.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static ExclusionInclude include() {
    return ExclusionInclude._();
  }

  static ExclusionIncludeList includeList({
    _i1.WhereExpressionBuilder<ExclusionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ExclusionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExclusionTable>? orderByList,
    ExclusionInclude? include,
  }) {
    return ExclusionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Exclusion.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Exclusion.t),
      include: include,
    );
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

class ExclusionTable extends _i1.Table {
  ExclusionTable({super.tableRelation}) : super(tableName: 'exclusions') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    type = _i1.ColumnString(
      'type',
      this,
    );
    value = _i1.ColumnString(
      'value',
      this,
    );
    reason = _i1.ColumnString(
      'reason',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString type;

  late final _i1.ColumnString value;

  late final _i1.ColumnString reason;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        type,
        value,
        reason,
        createdAt,
      ];
}

@Deprecated('Use ExclusionTable.t instead.')
ExclusionTable tExclusion = ExclusionTable();

class ExclusionInclude extends _i1.IncludeObject {
  ExclusionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Exclusion.t;
}

class ExclusionIncludeList extends _i1.IncludeList {
  ExclusionIncludeList._({
    _i1.WhereExpressionBuilder<ExclusionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Exclusion.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Exclusion.t;
}

class ExclusionRepository {
  const ExclusionRepository._();

  Future<List<Exclusion>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExclusionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ExclusionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExclusionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<Exclusion>(
      where: where?.call(Exclusion.t),
      orderBy: orderBy?.call(Exclusion.t),
      orderByList: orderByList?.call(Exclusion.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Exclusion?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExclusionTable>? where,
    int? offset,
    _i1.OrderByBuilder<ExclusionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExclusionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<Exclusion>(
      where: where?.call(Exclusion.t),
      orderBy: orderBy?.call(Exclusion.t),
      orderByList: orderByList?.call(Exclusion.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Exclusion?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<Exclusion>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Exclusion>> insert(
    _i1.Session session,
    List<Exclusion> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<Exclusion>(
      rows,
      transaction: transaction,
    );
  }

  Future<Exclusion> insertRow(
    _i1.Session session,
    Exclusion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<Exclusion>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Exclusion>> update(
    _i1.Session session,
    List<Exclusion> rows, {
    _i1.ColumnSelections<ExclusionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<Exclusion>(
      rows,
      columns: columns?.call(Exclusion.t),
      transaction: transaction,
    );
  }

  Future<Exclusion> updateRow(
    _i1.Session session,
    Exclusion row, {
    _i1.ColumnSelections<ExclusionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<Exclusion>(
      row,
      columns: columns?.call(Exclusion.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<Exclusion> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<Exclusion>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    Exclusion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<Exclusion>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ExclusionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<Exclusion>(
      where: where(Exclusion.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExclusionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<Exclusion>(
      where: where?.call(Exclusion.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

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

abstract class UnsubscribeQueue extends _i1.TableRow {
  UnsubscribeQueue._({
    int? id,
    required this.userId,
    required this.emailId,
    required this.senderEmail,
    this.unsubscribeLink,
    required this.status,
    this.action,
    this.processedAt,
    required this.createdAt,
  }) : super(id);

  factory UnsubscribeQueue({
    int? id,
    required int userId,
    required int emailId,
    required String senderEmail,
    String? unsubscribeLink,
    required String status,
    String? action,
    DateTime? processedAt,
    required DateTime createdAt,
  }) = _UnsubscribeQueueImpl;

  factory UnsubscribeQueue.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return UnsubscribeQueue(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      emailId:
          serializationManager.deserialize<int>(jsonSerialization['emailId']),
      senderEmail: serializationManager
          .deserialize<String>(jsonSerialization['senderEmail']),
      unsubscribeLink: serializationManager
          .deserialize<String?>(jsonSerialization['unsubscribeLink']),
      status:
          serializationManager.deserialize<String>(jsonSerialization['status']),
      action: serializationManager
          .deserialize<String?>(jsonSerialization['action']),
      processedAt: serializationManager
          .deserialize<DateTime?>(jsonSerialization['processedAt']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
    );
  }

  static final t = UnsubscribeQueueTable();

  static const db = UnsubscribeQueueRepository._();

  int userId;

  int emailId;

  String senderEmail;

  String? unsubscribeLink;

  String status;

  String? action;

  DateTime? processedAt;

  DateTime createdAt;

  @override
  _i1.Table get table => t;

  UnsubscribeQueue copyWith({
    int? id,
    int? userId,
    int? emailId,
    String? senderEmail,
    String? unsubscribeLink,
    String? status,
    String? action,
    DateTime? processedAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'emailId': emailId,
      'senderEmail': senderEmail,
      if (unsubscribeLink != null) 'unsubscribeLink': unsubscribeLink,
      'status': status,
      if (action != null) 'action': action,
      if (processedAt != null) 'processedAt': processedAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'userId': userId,
      'emailId': emailId,
      'senderEmail': senderEmail,
      'unsubscribeLink': unsubscribeLink,
      'status': status,
      'action': action,
      'processedAt': processedAt,
      'createdAt': createdAt,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'emailId': emailId,
      'senderEmail': senderEmail,
      if (unsubscribeLink != null) 'unsubscribeLink': unsubscribeLink,
      'status': status,
      if (action != null) 'action': action,
      if (processedAt != null) 'processedAt': processedAt?.toJson(),
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
      case 'emailId':
        emailId = value;
        return;
      case 'senderEmail':
        senderEmail = value;
        return;
      case 'unsubscribeLink':
        unsubscribeLink = value;
        return;
      case 'status':
        status = value;
        return;
      case 'action':
        action = value;
        return;
      case 'processedAt':
        processedAt = value;
        return;
      case 'createdAt':
        createdAt = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<UnsubscribeQueue>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UnsubscribeQueueTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UnsubscribeQueue>(
      where: where != null ? where(UnsubscribeQueue.t) : null,
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
  static Future<UnsubscribeQueue?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UnsubscribeQueueTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<UnsubscribeQueue>(
      where: where != null ? where(UnsubscribeQueue.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<UnsubscribeQueue?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<UnsubscribeQueue>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UnsubscribeQueueTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UnsubscribeQueue>(
      where: where(UnsubscribeQueue.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    UnsubscribeQueue row, {
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
    UnsubscribeQueue row, {
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
    UnsubscribeQueue row, {
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
    _i1.WhereExpressionBuilder<UnsubscribeQueueTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UnsubscribeQueue>(
      where: where != null ? where(UnsubscribeQueue.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static UnsubscribeQueueInclude include() {
    return UnsubscribeQueueInclude._();
  }

  static UnsubscribeQueueIncludeList includeList({
    _i1.WhereExpressionBuilder<UnsubscribeQueueTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UnsubscribeQueueTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UnsubscribeQueueTable>? orderByList,
    UnsubscribeQueueInclude? include,
  }) {
    return UnsubscribeQueueIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UnsubscribeQueue.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UnsubscribeQueue.t),
      include: include,
    );
  }
}

class _Undefined {}

class _UnsubscribeQueueImpl extends UnsubscribeQueue {
  _UnsubscribeQueueImpl({
    int? id,
    required int userId,
    required int emailId,
    required String senderEmail,
    String? unsubscribeLink,
    required String status,
    String? action,
    DateTime? processedAt,
    required DateTime createdAt,
  }) : super._(
          id: id,
          userId: userId,
          emailId: emailId,
          senderEmail: senderEmail,
          unsubscribeLink: unsubscribeLink,
          status: status,
          action: action,
          processedAt: processedAt,
          createdAt: createdAt,
        );

  @override
  UnsubscribeQueue copyWith({
    Object? id = _Undefined,
    int? userId,
    int? emailId,
    String? senderEmail,
    Object? unsubscribeLink = _Undefined,
    String? status,
    Object? action = _Undefined,
    Object? processedAt = _Undefined,
    DateTime? createdAt,
  }) {
    return UnsubscribeQueue(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      emailId: emailId ?? this.emailId,
      senderEmail: senderEmail ?? this.senderEmail,
      unsubscribeLink:
          unsubscribeLink is String? ? unsubscribeLink : this.unsubscribeLink,
      status: status ?? this.status,
      action: action is String? ? action : this.action,
      processedAt: processedAt is DateTime? ? processedAt : this.processedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class UnsubscribeQueueTable extends _i1.Table {
  UnsubscribeQueueTable({super.tableRelation})
      : super(tableName: 'unsubscribe_queue') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    emailId = _i1.ColumnInt(
      'emailId',
      this,
    );
    senderEmail = _i1.ColumnString(
      'senderEmail',
      this,
    );
    unsubscribeLink = _i1.ColumnString(
      'unsubscribeLink',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    action = _i1.ColumnString(
      'action',
      this,
    );
    processedAt = _i1.ColumnDateTime(
      'processedAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnInt emailId;

  late final _i1.ColumnString senderEmail;

  late final _i1.ColumnString unsubscribeLink;

  late final _i1.ColumnString status;

  late final _i1.ColumnString action;

  late final _i1.ColumnDateTime processedAt;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        emailId,
        senderEmail,
        unsubscribeLink,
        status,
        action,
        processedAt,
        createdAt,
      ];
}

@Deprecated('Use UnsubscribeQueueTable.t instead.')
UnsubscribeQueueTable tUnsubscribeQueue = UnsubscribeQueueTable();

class UnsubscribeQueueInclude extends _i1.IncludeObject {
  UnsubscribeQueueInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => UnsubscribeQueue.t;
}

class UnsubscribeQueueIncludeList extends _i1.IncludeList {
  UnsubscribeQueueIncludeList._({
    _i1.WhereExpressionBuilder<UnsubscribeQueueTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UnsubscribeQueue.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => UnsubscribeQueue.t;
}

class UnsubscribeQueueRepository {
  const UnsubscribeQueueRepository._();

  Future<List<UnsubscribeQueue>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UnsubscribeQueueTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UnsubscribeQueueTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UnsubscribeQueueTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<UnsubscribeQueue>(
      where: where?.call(UnsubscribeQueue.t),
      orderBy: orderBy?.call(UnsubscribeQueue.t),
      orderByList: orderByList?.call(UnsubscribeQueue.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<UnsubscribeQueue?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UnsubscribeQueueTable>? where,
    int? offset,
    _i1.OrderByBuilder<UnsubscribeQueueTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UnsubscribeQueueTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<UnsubscribeQueue>(
      where: where?.call(UnsubscribeQueue.t),
      orderBy: orderBy?.call(UnsubscribeQueue.t),
      orderByList: orderByList?.call(UnsubscribeQueue.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<UnsubscribeQueue?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<UnsubscribeQueue>(
      id,
      transaction: transaction,
    );
  }

  Future<List<UnsubscribeQueue>> insert(
    _i1.Session session,
    List<UnsubscribeQueue> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<UnsubscribeQueue>(
      rows,
      transaction: transaction,
    );
  }

  Future<UnsubscribeQueue> insertRow(
    _i1.Session session,
    UnsubscribeQueue row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<UnsubscribeQueue>(
      row,
      transaction: transaction,
    );
  }

  Future<List<UnsubscribeQueue>> update(
    _i1.Session session,
    List<UnsubscribeQueue> rows, {
    _i1.ColumnSelections<UnsubscribeQueueTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<UnsubscribeQueue>(
      rows,
      columns: columns?.call(UnsubscribeQueue.t),
      transaction: transaction,
    );
  }

  Future<UnsubscribeQueue> updateRow(
    _i1.Session session,
    UnsubscribeQueue row, {
    _i1.ColumnSelections<UnsubscribeQueueTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<UnsubscribeQueue>(
      row,
      columns: columns?.call(UnsubscribeQueue.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<UnsubscribeQueue> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<UnsubscribeQueue>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    UnsubscribeQueue row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<UnsubscribeQueue>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UnsubscribeQueueTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<UnsubscribeQueue>(
      where: where(UnsubscribeQueue.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UnsubscribeQueueTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<UnsubscribeQueue>(
      where: where?.call(UnsubscribeQueue.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

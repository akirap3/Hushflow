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

abstract class WebhookLog extends _i1.TableRow {
  WebhookLog._({
    int? id,
    required this.messageId,
    this.historyId,
    required this.payload,
    required this.status,
    this.error,
    required this.receivedAt,
    this.processedAt,
  }) : super(id);

  factory WebhookLog({
    int? id,
    required String messageId,
    String? historyId,
    required String payload,
    required String status,
    String? error,
    required DateTime receivedAt,
    DateTime? processedAt,
  }) = _WebhookLogImpl;

  factory WebhookLog.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return WebhookLog(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      messageId: serializationManager
          .deserialize<String>(jsonSerialization['messageId']),
      historyId: serializationManager
          .deserialize<String?>(jsonSerialization['historyId']),
      payload: serializationManager
          .deserialize<String>(jsonSerialization['payload']),
      status:
          serializationManager.deserialize<String>(jsonSerialization['status']),
      error:
          serializationManager.deserialize<String?>(jsonSerialization['error']),
      receivedAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['receivedAt']),
      processedAt: serializationManager
          .deserialize<DateTime?>(jsonSerialization['processedAt']),
    );
  }

  static final t = WebhookLogTable();

  static const db = WebhookLogRepository._();

  String messageId;

  String? historyId;

  String payload;

  String status;

  String? error;

  DateTime receivedAt;

  DateTime? processedAt;

  @override
  _i1.Table get table => t;

  WebhookLog copyWith({
    int? id,
    String? messageId,
    String? historyId,
    String? payload,
    String? status,
    String? error,
    DateTime? receivedAt,
    DateTime? processedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'messageId': messageId,
      if (historyId != null) 'historyId': historyId,
      'payload': payload,
      'status': status,
      if (error != null) 'error': error,
      'receivedAt': receivedAt.toJson(),
      if (processedAt != null) 'processedAt': processedAt?.toJson(),
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'messageId': messageId,
      'historyId': historyId,
      'payload': payload,
      'status': status,
      'error': error,
      'receivedAt': receivedAt,
      'processedAt': processedAt,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'messageId': messageId,
      if (historyId != null) 'historyId': historyId,
      'payload': payload,
      'status': status,
      if (error != null) 'error': error,
      'receivedAt': receivedAt.toJson(),
      if (processedAt != null) 'processedAt': processedAt?.toJson(),
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
      case 'messageId':
        messageId = value;
        return;
      case 'historyId':
        historyId = value;
        return;
      case 'payload':
        payload = value;
        return;
      case 'status':
        status = value;
        return;
      case 'error':
        error = value;
        return;
      case 'receivedAt':
        receivedAt = value;
        return;
      case 'processedAt':
        processedAt = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<WebhookLog>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WebhookLogTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<WebhookLog>(
      where: where != null ? where(WebhookLog.t) : null,
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
  static Future<WebhookLog?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WebhookLogTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<WebhookLog>(
      where: where != null ? where(WebhookLog.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<WebhookLog?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<WebhookLog>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<WebhookLogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<WebhookLog>(
      where: where(WebhookLog.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    WebhookLog row, {
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
    WebhookLog row, {
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
    WebhookLog row, {
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
    _i1.WhereExpressionBuilder<WebhookLogTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<WebhookLog>(
      where: where != null ? where(WebhookLog.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static WebhookLogInclude include() {
    return WebhookLogInclude._();
  }

  static WebhookLogIncludeList includeList({
    _i1.WhereExpressionBuilder<WebhookLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WebhookLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WebhookLogTable>? orderByList,
    WebhookLogInclude? include,
  }) {
    return WebhookLogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(WebhookLog.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(WebhookLog.t),
      include: include,
    );
  }
}

class _Undefined {}

class _WebhookLogImpl extends WebhookLog {
  _WebhookLogImpl({
    int? id,
    required String messageId,
    String? historyId,
    required String payload,
    required String status,
    String? error,
    required DateTime receivedAt,
    DateTime? processedAt,
  }) : super._(
          id: id,
          messageId: messageId,
          historyId: historyId,
          payload: payload,
          status: status,
          error: error,
          receivedAt: receivedAt,
          processedAt: processedAt,
        );

  @override
  WebhookLog copyWith({
    Object? id = _Undefined,
    String? messageId,
    Object? historyId = _Undefined,
    String? payload,
    String? status,
    Object? error = _Undefined,
    DateTime? receivedAt,
    Object? processedAt = _Undefined,
  }) {
    return WebhookLog(
      id: id is int? ? id : this.id,
      messageId: messageId ?? this.messageId,
      historyId: historyId is String? ? historyId : this.historyId,
      payload: payload ?? this.payload,
      status: status ?? this.status,
      error: error is String? ? error : this.error,
      receivedAt: receivedAt ?? this.receivedAt,
      processedAt: processedAt is DateTime? ? processedAt : this.processedAt,
    );
  }
}

class WebhookLogTable extends _i1.Table {
  WebhookLogTable({super.tableRelation}) : super(tableName: 'webhook_logs') {
    messageId = _i1.ColumnString(
      'messageId',
      this,
    );
    historyId = _i1.ColumnString(
      'historyId',
      this,
    );
    payload = _i1.ColumnString(
      'payload',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    error = _i1.ColumnString(
      'error',
      this,
    );
    receivedAt = _i1.ColumnDateTime(
      'receivedAt',
      this,
    );
    processedAt = _i1.ColumnDateTime(
      'processedAt',
      this,
    );
  }

  late final _i1.ColumnString messageId;

  late final _i1.ColumnString historyId;

  late final _i1.ColumnString payload;

  late final _i1.ColumnString status;

  late final _i1.ColumnString error;

  late final _i1.ColumnDateTime receivedAt;

  late final _i1.ColumnDateTime processedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        messageId,
        historyId,
        payload,
        status,
        error,
        receivedAt,
        processedAt,
      ];
}

@Deprecated('Use WebhookLogTable.t instead.')
WebhookLogTable tWebhookLog = WebhookLogTable();

class WebhookLogInclude extends _i1.IncludeObject {
  WebhookLogInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => WebhookLog.t;
}

class WebhookLogIncludeList extends _i1.IncludeList {
  WebhookLogIncludeList._({
    _i1.WhereExpressionBuilder<WebhookLogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(WebhookLog.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => WebhookLog.t;
}

class WebhookLogRepository {
  const WebhookLogRepository._();

  Future<List<WebhookLog>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WebhookLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WebhookLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WebhookLogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<WebhookLog>(
      where: where?.call(WebhookLog.t),
      orderBy: orderBy?.call(WebhookLog.t),
      orderByList: orderByList?.call(WebhookLog.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<WebhookLog?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WebhookLogTable>? where,
    int? offset,
    _i1.OrderByBuilder<WebhookLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WebhookLogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<WebhookLog>(
      where: where?.call(WebhookLog.t),
      orderBy: orderBy?.call(WebhookLog.t),
      orderByList: orderByList?.call(WebhookLog.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<WebhookLog?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<WebhookLog>(
      id,
      transaction: transaction,
    );
  }

  Future<List<WebhookLog>> insert(
    _i1.Session session,
    List<WebhookLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<WebhookLog>(
      rows,
      transaction: transaction,
    );
  }

  Future<WebhookLog> insertRow(
    _i1.Session session,
    WebhookLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<WebhookLog>(
      row,
      transaction: transaction,
    );
  }

  Future<List<WebhookLog>> update(
    _i1.Session session,
    List<WebhookLog> rows, {
    _i1.ColumnSelections<WebhookLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<WebhookLog>(
      rows,
      columns: columns?.call(WebhookLog.t),
      transaction: transaction,
    );
  }

  Future<WebhookLog> updateRow(
    _i1.Session session,
    WebhookLog row, {
    _i1.ColumnSelections<WebhookLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<WebhookLog>(
      row,
      columns: columns?.call(WebhookLog.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<WebhookLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<WebhookLog>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    WebhookLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<WebhookLog>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<WebhookLogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<WebhookLog>(
      where: where(WebhookLog.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WebhookLogTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<WebhookLog>(
      where: where?.call(WebhookLog.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

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

abstract class Summary extends _i1.TableRow {
  Summary._({
    int? id,
    required this.userId,
    required this.title,
    required this.content,
    this.audioUrl,
    required this.emailCount,
    required this.generatedAt,
    required this.periodStart,
    required this.periodEnd,
    required this.isRead,
  }) : super(id);

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

  static final t = SummaryTable();

  static const db = SummaryRepository._();

  int userId;

  String title;

  String content;

  String? audioUrl;

  int emailCount;

  DateTime generatedAt;

  DateTime periodStart;

  DateTime periodEnd;

  bool isRead;

  @override
  _i1.Table get table => t;

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

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'content': content,
      'audioUrl': audioUrl,
      'emailCount': emailCount,
      'generatedAt': generatedAt,
      'periodStart': periodStart,
      'periodEnd': periodEnd,
      'isRead': isRead,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
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
      case 'title':
        title = value;
        return;
      case 'content':
        content = value;
        return;
      case 'audioUrl':
        audioUrl = value;
        return;
      case 'emailCount':
        emailCount = value;
        return;
      case 'generatedAt':
        generatedAt = value;
        return;
      case 'periodStart':
        periodStart = value;
        return;
      case 'periodEnd':
        periodEnd = value;
        return;
      case 'isRead':
        isRead = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<Summary>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SummaryTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Summary>(
      where: where != null ? where(Summary.t) : null,
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
  static Future<Summary?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SummaryTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Summary>(
      where: where != null ? where(Summary.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<Summary?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Summary>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SummaryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Summary>(
      where: where(Summary.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    Summary row, {
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
    Summary row, {
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
    Summary row, {
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
    _i1.WhereExpressionBuilder<SummaryTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Summary>(
      where: where != null ? where(Summary.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static SummaryInclude include() {
    return SummaryInclude._();
  }

  static SummaryIncludeList includeList({
    _i1.WhereExpressionBuilder<SummaryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SummaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SummaryTable>? orderByList,
    SummaryInclude? include,
  }) {
    return SummaryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Summary.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Summary.t),
      include: include,
    );
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

class SummaryTable extends _i1.Table {
  SummaryTable({super.tableRelation}) : super(tableName: 'summaries') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
    audioUrl = _i1.ColumnString(
      'audioUrl',
      this,
    );
    emailCount = _i1.ColumnInt(
      'emailCount',
      this,
    );
    generatedAt = _i1.ColumnDateTime(
      'generatedAt',
      this,
    );
    periodStart = _i1.ColumnDateTime(
      'periodStart',
      this,
    );
    periodEnd = _i1.ColumnDateTime(
      'periodEnd',
      this,
    );
    isRead = _i1.ColumnBool(
      'isRead',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString title;

  late final _i1.ColumnString content;

  late final _i1.ColumnString audioUrl;

  late final _i1.ColumnInt emailCount;

  late final _i1.ColumnDateTime generatedAt;

  late final _i1.ColumnDateTime periodStart;

  late final _i1.ColumnDateTime periodEnd;

  late final _i1.ColumnBool isRead;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        title,
        content,
        audioUrl,
        emailCount,
        generatedAt,
        periodStart,
        periodEnd,
        isRead,
      ];
}

@Deprecated('Use SummaryTable.t instead.')
SummaryTable tSummary = SummaryTable();

class SummaryInclude extends _i1.IncludeObject {
  SummaryInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Summary.t;
}

class SummaryIncludeList extends _i1.IncludeList {
  SummaryIncludeList._({
    _i1.WhereExpressionBuilder<SummaryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Summary.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Summary.t;
}

class SummaryRepository {
  const SummaryRepository._();

  Future<List<Summary>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SummaryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SummaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SummaryTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<Summary>(
      where: where?.call(Summary.t),
      orderBy: orderBy?.call(Summary.t),
      orderByList: orderByList?.call(Summary.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Summary?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SummaryTable>? where,
    int? offset,
    _i1.OrderByBuilder<SummaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SummaryTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<Summary>(
      where: where?.call(Summary.t),
      orderBy: orderBy?.call(Summary.t),
      orderByList: orderByList?.call(Summary.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Summary?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<Summary>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Summary>> insert(
    _i1.Session session,
    List<Summary> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<Summary>(
      rows,
      transaction: transaction,
    );
  }

  Future<Summary> insertRow(
    _i1.Session session,
    Summary row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<Summary>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Summary>> update(
    _i1.Session session,
    List<Summary> rows, {
    _i1.ColumnSelections<SummaryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<Summary>(
      rows,
      columns: columns?.call(Summary.t),
      transaction: transaction,
    );
  }

  Future<Summary> updateRow(
    _i1.Session session,
    Summary row, {
    _i1.ColumnSelections<SummaryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<Summary>(
      row,
      columns: columns?.call(Summary.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<Summary> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<Summary>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    Summary row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<Summary>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SummaryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<Summary>(
      where: where(Summary.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SummaryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<Summary>(
      where: where?.call(Summary.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

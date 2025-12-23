/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class SummaryItem extends _i1.TableRow {
  SummaryItem._({
    int? id,
    required this.summaryId,
    required this.emailId,
    required this.sender,
    required this.subject,
    required this.summaryText,
    this.imageUrl,
    required this.priorityScore,
    required this.order,
  }) : super(id);

  factory SummaryItem({
    int? id,
    required int summaryId,
    required int emailId,
    required String sender,
    required String subject,
    required String summaryText,
    String? imageUrl,
    required double priorityScore,
    required int order,
  }) = _SummaryItemImpl;

  factory SummaryItem.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return SummaryItem(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      summaryId:
          serializationManager.deserialize<int>(jsonSerialization['summaryId']),
      emailId:
          serializationManager.deserialize<int>(jsonSerialization['emailId']),
      sender:
          serializationManager.deserialize<String>(jsonSerialization['sender']),
      subject: serializationManager
          .deserialize<String>(jsonSerialization['subject']),
      summaryText: serializationManager
          .deserialize<String>(jsonSerialization['summaryText']),
      imageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['imageUrl']),
      priorityScore: serializationManager
          .deserialize<double>(jsonSerialization['priorityScore']),
      order: serializationManager.deserialize<int>(jsonSerialization['order']),
    );
  }

  static final t = SummaryItemTable();

  static const db = SummaryItemRepository._();

  int summaryId;

  int emailId;

  String sender;

  String subject;

  String summaryText;

  String? imageUrl;

  double priorityScore;

  int order;

  @override
  _i1.Table get table => t;

  SummaryItem copyWith({
    int? id,
    int? summaryId,
    int? emailId,
    String? sender,
    String? subject,
    String? summaryText,
    String? imageUrl,
    double? priorityScore,
    int? order,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'summaryId': summaryId,
      'emailId': emailId,
      'sender': sender,
      'subject': subject,
      'summaryText': summaryText,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'priorityScore': priorityScore,
      'order': order,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'summaryId': summaryId,
      'emailId': emailId,
      'sender': sender,
      'subject': subject,
      'summaryText': summaryText,
      'imageUrl': imageUrl,
      'priorityScore': priorityScore,
      'order': order,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'summaryId': summaryId,
      'emailId': emailId,
      'sender': sender,
      'subject': subject,
      'summaryText': summaryText,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'priorityScore': priorityScore,
      'order': order,
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
      case 'summaryId':
        summaryId = value;
        return;
      case 'emailId':
        emailId = value;
        return;
      case 'sender':
        sender = value;
        return;
      case 'subject':
        subject = value;
        return;
      case 'summaryText':
        summaryText = value;
        return;
      case 'imageUrl':
        imageUrl = value;
        return;
      case 'priorityScore':
        priorityScore = value;
        return;
      case 'order':
        order = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<SummaryItem>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SummaryItemTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<SummaryItem>(
      where: where != null ? where(SummaryItem.t) : null,
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
  static Future<SummaryItem?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SummaryItemTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<SummaryItem>(
      where: where != null ? where(SummaryItem.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<SummaryItem?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<SummaryItem>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SummaryItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SummaryItem>(
      where: where(SummaryItem.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    SummaryItem row, {
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
    SummaryItem row, {
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
    SummaryItem row, {
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
    _i1.WhereExpressionBuilder<SummaryItemTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SummaryItem>(
      where: where != null ? where(SummaryItem.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static SummaryItemInclude include() {
    return SummaryItemInclude._();
  }

  static SummaryItemIncludeList includeList({
    _i1.WhereExpressionBuilder<SummaryItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SummaryItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SummaryItemTable>? orderByList,
    SummaryItemInclude? include,
  }) {
    return SummaryItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SummaryItem.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SummaryItem.t),
      include: include,
    );
  }
}

class _Undefined {}

class _SummaryItemImpl extends SummaryItem {
  _SummaryItemImpl({
    int? id,
    required int summaryId,
    required int emailId,
    required String sender,
    required String subject,
    required String summaryText,
    String? imageUrl,
    required double priorityScore,
    required int order,
  }) : super._(
          id: id,
          summaryId: summaryId,
          emailId: emailId,
          sender: sender,
          subject: subject,
          summaryText: summaryText,
          imageUrl: imageUrl,
          priorityScore: priorityScore,
          order: order,
        );

  @override
  SummaryItem copyWith({
    Object? id = _Undefined,
    int? summaryId,
    int? emailId,
    String? sender,
    String? subject,
    String? summaryText,
    Object? imageUrl = _Undefined,
    double? priorityScore,
    int? order,
  }) {
    return SummaryItem(
      id: id is int? ? id : this.id,
      summaryId: summaryId ?? this.summaryId,
      emailId: emailId ?? this.emailId,
      sender: sender ?? this.sender,
      subject: subject ?? this.subject,
      summaryText: summaryText ?? this.summaryText,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
      priorityScore: priorityScore ?? this.priorityScore,
      order: order ?? this.order,
    );
  }
}

class SummaryItemTable extends _i1.Table {
  SummaryItemTable({super.tableRelation}) : super(tableName: 'summary_items') {
    summaryId = _i1.ColumnInt(
      'summaryId',
      this,
    );
    emailId = _i1.ColumnInt(
      'emailId',
      this,
    );
    sender = _i1.ColumnString(
      'sender',
      this,
    );
    subject = _i1.ColumnString(
      'subject',
      this,
    );
    summaryText = _i1.ColumnString(
      'summaryText',
      this,
    );
    imageUrl = _i1.ColumnString(
      'imageUrl',
      this,
    );
    priorityScore = _i1.ColumnDouble(
      'priorityScore',
      this,
    );
    order = _i1.ColumnInt(
      'order',
      this,
    );
  }

  late final _i1.ColumnInt summaryId;

  late final _i1.ColumnInt emailId;

  late final _i1.ColumnString sender;

  late final _i1.ColumnString subject;

  late final _i1.ColumnString summaryText;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnDouble priorityScore;

  late final _i1.ColumnInt order;

  @override
  List<_i1.Column> get columns => [
        id,
        summaryId,
        emailId,
        sender,
        subject,
        summaryText,
        imageUrl,
        priorityScore,
        order,
      ];
}

@Deprecated('Use SummaryItemTable.t instead.')
SummaryItemTable tSummaryItem = SummaryItemTable();

class SummaryItemInclude extends _i1.IncludeObject {
  SummaryItemInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => SummaryItem.t;
}

class SummaryItemIncludeList extends _i1.IncludeList {
  SummaryItemIncludeList._({
    _i1.WhereExpressionBuilder<SummaryItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SummaryItem.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => SummaryItem.t;
}

class SummaryItemRepository {
  const SummaryItemRepository._();

  Future<List<SummaryItem>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SummaryItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SummaryItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SummaryItemTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<SummaryItem>(
      where: where?.call(SummaryItem.t),
      orderBy: orderBy?.call(SummaryItem.t),
      orderByList: orderByList?.call(SummaryItem.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<SummaryItem?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SummaryItemTable>? where,
    int? offset,
    _i1.OrderByBuilder<SummaryItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SummaryItemTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<SummaryItem>(
      where: where?.call(SummaryItem.t),
      orderBy: orderBy?.call(SummaryItem.t),
      orderByList: orderByList?.call(SummaryItem.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<SummaryItem?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<SummaryItem>(
      id,
      transaction: transaction,
    );
  }

  Future<List<SummaryItem>> insert(
    _i1.Session session,
    List<SummaryItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<SummaryItem>(
      rows,
      transaction: transaction,
    );
  }

  Future<SummaryItem> insertRow(
    _i1.Session session,
    SummaryItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<SummaryItem>(
      row,
      transaction: transaction,
    );
  }

  Future<List<SummaryItem>> update(
    _i1.Session session,
    List<SummaryItem> rows, {
    _i1.ColumnSelections<SummaryItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<SummaryItem>(
      rows,
      columns: columns?.call(SummaryItem.t),
      transaction: transaction,
    );
  }

  Future<SummaryItem> updateRow(
    _i1.Session session,
    SummaryItem row, {
    _i1.ColumnSelections<SummaryItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<SummaryItem>(
      row,
      columns: columns?.call(SummaryItem.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<SummaryItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<SummaryItem>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    SummaryItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<SummaryItem>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SummaryItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<SummaryItem>(
      where: where(SummaryItem.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SummaryItemTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<SummaryItem>(
      where: where?.call(SummaryItem.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

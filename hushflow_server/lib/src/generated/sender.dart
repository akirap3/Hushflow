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

abstract class Sender extends _i1.TableRow {
  Sender._({
    int? id,
    required this.userId,
    required this.email,
    this.name,
    required this.isExcluded,
    required this.isBlocked,
    required this.totalEmails,
    required this.openedEmails,
    this.lastEmailAt,
    required this.createdAt,
    required this.updatedAt,
  }) : super(id);

  factory Sender({
    int? id,
    required int userId,
    required String email,
    String? name,
    required bool isExcluded,
    required bool isBlocked,
    required int totalEmails,
    required int openedEmails,
    DateTime? lastEmailAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SenderImpl;

  factory Sender.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Sender(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      name:
          serializationManager.deserialize<String?>(jsonSerialization['name']),
      isExcluded: serializationManager
          .deserialize<bool>(jsonSerialization['isExcluded']),
      isBlocked: serializationManager
          .deserialize<bool>(jsonSerialization['isBlocked']),
      totalEmails: serializationManager
          .deserialize<int>(jsonSerialization['totalEmails']),
      openedEmails: serializationManager
          .deserialize<int>(jsonSerialization['openedEmails']),
      lastEmailAt: serializationManager
          .deserialize<DateTime?>(jsonSerialization['lastEmailAt']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
      updatedAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['updatedAt']),
    );
  }

  static final t = SenderTable();

  static const db = SenderRepository._();

  int userId;

  String email;

  String? name;

  bool isExcluded;

  bool isBlocked;

  int totalEmails;

  int openedEmails;

  DateTime? lastEmailAt;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table get table => t;

  Sender copyWith({
    int? id,
    int? userId,
    String? email,
    String? name,
    bool? isExcluded,
    bool? isBlocked,
    int? totalEmails,
    int? openedEmails,
    DateTime? lastEmailAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'email': email,
      if (name != null) 'name': name,
      'isExcluded': isExcluded,
      'isBlocked': isBlocked,
      'totalEmails': totalEmails,
      'openedEmails': openedEmails,
      if (lastEmailAt != null) 'lastEmailAt': lastEmailAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'userId': userId,
      'email': email,
      'name': name,
      'isExcluded': isExcluded,
      'isBlocked': isBlocked,
      'totalEmails': totalEmails,
      'openedEmails': openedEmails,
      'lastEmailAt': lastEmailAt,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'email': email,
      if (name != null) 'name': name,
      'isExcluded': isExcluded,
      'isBlocked': isBlocked,
      'totalEmails': totalEmails,
      'openedEmails': openedEmails,
      if (lastEmailAt != null) 'lastEmailAt': lastEmailAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
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
      case 'email':
        email = value;
        return;
      case 'name':
        name = value;
        return;
      case 'isExcluded':
        isExcluded = value;
        return;
      case 'isBlocked':
        isBlocked = value;
        return;
      case 'totalEmails':
        totalEmails = value;
        return;
      case 'openedEmails':
        openedEmails = value;
        return;
      case 'lastEmailAt':
        lastEmailAt = value;
        return;
      case 'createdAt':
        createdAt = value;
        return;
      case 'updatedAt':
        updatedAt = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<Sender>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SenderTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Sender>(
      where: where != null ? where(Sender.t) : null,
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
  static Future<Sender?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SenderTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Sender>(
      where: where != null ? where(Sender.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<Sender?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Sender>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SenderTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Sender>(
      where: where(Sender.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    Sender row, {
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
    Sender row, {
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
    Sender row, {
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
    _i1.WhereExpressionBuilder<SenderTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Sender>(
      where: where != null ? where(Sender.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static SenderInclude include() {
    return SenderInclude._();
  }

  static SenderIncludeList includeList({
    _i1.WhereExpressionBuilder<SenderTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SenderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SenderTable>? orderByList,
    SenderInclude? include,
  }) {
    return SenderIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Sender.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Sender.t),
      include: include,
    );
  }
}

class _Undefined {}

class _SenderImpl extends Sender {
  _SenderImpl({
    int? id,
    required int userId,
    required String email,
    String? name,
    required bool isExcluded,
    required bool isBlocked,
    required int totalEmails,
    required int openedEmails,
    DateTime? lastEmailAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          userId: userId,
          email: email,
          name: name,
          isExcluded: isExcluded,
          isBlocked: isBlocked,
          totalEmails: totalEmails,
          openedEmails: openedEmails,
          lastEmailAt: lastEmailAt,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  Sender copyWith({
    Object? id = _Undefined,
    int? userId,
    String? email,
    Object? name = _Undefined,
    bool? isExcluded,
    bool? isBlocked,
    int? totalEmails,
    int? openedEmails,
    Object? lastEmailAt = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Sender(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name is String? ? name : this.name,
      isExcluded: isExcluded ?? this.isExcluded,
      isBlocked: isBlocked ?? this.isBlocked,
      totalEmails: totalEmails ?? this.totalEmails,
      openedEmails: openedEmails ?? this.openedEmails,
      lastEmailAt: lastEmailAt is DateTime? ? lastEmailAt : this.lastEmailAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class SenderTable extends _i1.Table {
  SenderTable({super.tableRelation}) : super(tableName: 'senders') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    isExcluded = _i1.ColumnBool(
      'isExcluded',
      this,
    );
    isBlocked = _i1.ColumnBool(
      'isBlocked',
      this,
    );
    totalEmails = _i1.ColumnInt(
      'totalEmails',
      this,
    );
    openedEmails = _i1.ColumnInt(
      'openedEmails',
      this,
    );
    lastEmailAt = _i1.ColumnDateTime(
      'lastEmailAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString email;

  late final _i1.ColumnString name;

  late final _i1.ColumnBool isExcluded;

  late final _i1.ColumnBool isBlocked;

  late final _i1.ColumnInt totalEmails;

  late final _i1.ColumnInt openedEmails;

  late final _i1.ColumnDateTime lastEmailAt;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        email,
        name,
        isExcluded,
        isBlocked,
        totalEmails,
        openedEmails,
        lastEmailAt,
        createdAt,
        updatedAt,
      ];
}

@Deprecated('Use SenderTable.t instead.')
SenderTable tSender = SenderTable();

class SenderInclude extends _i1.IncludeObject {
  SenderInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Sender.t;
}

class SenderIncludeList extends _i1.IncludeList {
  SenderIncludeList._({
    _i1.WhereExpressionBuilder<SenderTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Sender.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Sender.t;
}

class SenderRepository {
  const SenderRepository._();

  Future<List<Sender>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SenderTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SenderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SenderTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<Sender>(
      where: where?.call(Sender.t),
      orderBy: orderBy?.call(Sender.t),
      orderByList: orderByList?.call(Sender.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Sender?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SenderTable>? where,
    int? offset,
    _i1.OrderByBuilder<SenderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SenderTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<Sender>(
      where: where?.call(Sender.t),
      orderBy: orderBy?.call(Sender.t),
      orderByList: orderByList?.call(Sender.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Sender?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<Sender>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Sender>> insert(
    _i1.Session session,
    List<Sender> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<Sender>(
      rows,
      transaction: transaction,
    );
  }

  Future<Sender> insertRow(
    _i1.Session session,
    Sender row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<Sender>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Sender>> update(
    _i1.Session session,
    List<Sender> rows, {
    _i1.ColumnSelections<SenderTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<Sender>(
      rows,
      columns: columns?.call(Sender.t),
      transaction: transaction,
    );
  }

  Future<Sender> updateRow(
    _i1.Session session,
    Sender row, {
    _i1.ColumnSelections<SenderTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<Sender>(
      row,
      columns: columns?.call(Sender.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<Sender> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<Sender>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    Sender row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<Sender>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SenderTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<Sender>(
      where: where(Sender.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SenderTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<Sender>(
      where: where?.call(Sender.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

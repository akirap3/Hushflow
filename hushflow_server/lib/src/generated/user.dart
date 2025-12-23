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

abstract class User extends _i1.TableRow {
  User._({
    int? id,
    required this.googleId,
    required this.email,
    this.accessToken,
    this.refreshToken,
    this.tokenExpiresAt,
    this.historyId,
    this.summarySchedule,
    this.timezone,
    required this.createdAt,
    required this.updatedAt,
  }) : super(id);

  factory User({
    int? id,
    required String googleId,
    required String email,
    String? accessToken,
    String? refreshToken,
    DateTime? tokenExpiresAt,
    String? historyId,
    String? summarySchedule,
    String? timezone,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserImpl;

  factory User.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return User(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      googleId: serializationManager
          .deserialize<String>(jsonSerialization['googleId']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      accessToken: serializationManager
          .deserialize<String?>(jsonSerialization['accessToken']),
      refreshToken: serializationManager
          .deserialize<String?>(jsonSerialization['refreshToken']),
      tokenExpiresAt: serializationManager
          .deserialize<DateTime?>(jsonSerialization['tokenExpiresAt']),
      historyId: serializationManager
          .deserialize<String?>(jsonSerialization['historyId']),
      summarySchedule: serializationManager
          .deserialize<String?>(jsonSerialization['summarySchedule']),
      timezone: serializationManager
          .deserialize<String?>(jsonSerialization['timezone']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
      updatedAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['updatedAt']),
    );
  }

  static final t = UserTable();

  static const db = UserRepository._();

  String googleId;

  String email;

  String? accessToken;

  String? refreshToken;

  DateTime? tokenExpiresAt;

  String? historyId;

  String? summarySchedule;

  String? timezone;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table get table => t;

  User copyWith({
    int? id,
    String? googleId,
    String? email,
    String? accessToken,
    String? refreshToken,
    DateTime? tokenExpiresAt,
    String? historyId,
    String? summarySchedule,
    String? timezone,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'googleId': googleId,
      'email': email,
      if (accessToken != null) 'accessToken': accessToken,
      if (refreshToken != null) 'refreshToken': refreshToken,
      if (tokenExpiresAt != null) 'tokenExpiresAt': tokenExpiresAt?.toJson(),
      if (historyId != null) 'historyId': historyId,
      if (summarySchedule != null) 'summarySchedule': summarySchedule,
      if (timezone != null) 'timezone': timezone,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'googleId': googleId,
      'email': email,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'tokenExpiresAt': tokenExpiresAt,
      'historyId': historyId,
      'summarySchedule': summarySchedule,
      'timezone': timezone,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'googleId': googleId,
      'email': email,
      if (accessToken != null) 'accessToken': accessToken,
      if (refreshToken != null) 'refreshToken': refreshToken,
      if (tokenExpiresAt != null) 'tokenExpiresAt': tokenExpiresAt?.toJson(),
      if (historyId != null) 'historyId': historyId,
      if (summarySchedule != null) 'summarySchedule': summarySchedule,
      if (timezone != null) 'timezone': timezone,
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
      case 'googleId':
        googleId = value;
        return;
      case 'email':
        email = value;
        return;
      case 'accessToken':
        accessToken = value;
        return;
      case 'refreshToken':
        refreshToken = value;
        return;
      case 'tokenExpiresAt':
        tokenExpiresAt = value;
        return;
      case 'historyId':
        historyId = value;
        return;
      case 'summarySchedule':
        summarySchedule = value;
        return;
      case 'timezone':
        timezone = value;
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
  static Future<List<User>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<User>(
      where: where != null ? where(User.t) : null,
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
  static Future<User?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<User>(
      where: where != null ? where(User.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<User?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<User>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    User row, {
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
    User row, {
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
    User row, {
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
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<User>(
      where: where != null ? where(User.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static UserInclude include() {
    return UserInclude._();
  }

  static UserIncludeList includeList({
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    UserInclude? include,
  }) {
    return UserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(User.t),
      include: include,
    );
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String googleId,
    required String email,
    String? accessToken,
    String? refreshToken,
    DateTime? tokenExpiresAt,
    String? historyId,
    String? summarySchedule,
    String? timezone,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          googleId: googleId,
          email: email,
          accessToken: accessToken,
          refreshToken: refreshToken,
          tokenExpiresAt: tokenExpiresAt,
          historyId: historyId,
          summarySchedule: summarySchedule,
          timezone: timezone,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  User copyWith({
    Object? id = _Undefined,
    String? googleId,
    String? email,
    Object? accessToken = _Undefined,
    Object? refreshToken = _Undefined,
    Object? tokenExpiresAt = _Undefined,
    Object? historyId = _Undefined,
    Object? summarySchedule = _Undefined,
    Object? timezone = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id is int? ? id : this.id,
      googleId: googleId ?? this.googleId,
      email: email ?? this.email,
      accessToken: accessToken is String? ? accessToken : this.accessToken,
      refreshToken: refreshToken is String? ? refreshToken : this.refreshToken,
      tokenExpiresAt:
          tokenExpiresAt is DateTime? ? tokenExpiresAt : this.tokenExpiresAt,
      historyId: historyId is String? ? historyId : this.historyId,
      summarySchedule:
          summarySchedule is String? ? summarySchedule : this.summarySchedule,
      timezone: timezone is String? ? timezone : this.timezone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class UserTable extends _i1.Table {
  UserTable({super.tableRelation}) : super(tableName: 'users') {
    googleId = _i1.ColumnString(
      'googleId',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    accessToken = _i1.ColumnString(
      'accessToken',
      this,
    );
    refreshToken = _i1.ColumnString(
      'refreshToken',
      this,
    );
    tokenExpiresAt = _i1.ColumnDateTime(
      'tokenExpiresAt',
      this,
    );
    historyId = _i1.ColumnString(
      'historyId',
      this,
    );
    summarySchedule = _i1.ColumnString(
      'summarySchedule',
      this,
    );
    timezone = _i1.ColumnString(
      'timezone',
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

  late final _i1.ColumnString googleId;

  late final _i1.ColumnString email;

  late final _i1.ColumnString accessToken;

  late final _i1.ColumnString refreshToken;

  late final _i1.ColumnDateTime tokenExpiresAt;

  late final _i1.ColumnString historyId;

  late final _i1.ColumnString summarySchedule;

  late final _i1.ColumnString timezone;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        googleId,
        email,
        accessToken,
        refreshToken,
        tokenExpiresAt,
        historyId,
        summarySchedule,
        timezone,
        createdAt,
        updatedAt,
      ];
}

@Deprecated('Use UserTable.t instead.')
UserTable tUser = UserTable();

class UserInclude extends _i1.IncludeObject {
  UserInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => User.t;
}

class UserIncludeList extends _i1.IncludeList {
  UserIncludeList._({
    _i1.WhereExpressionBuilder<UserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(User.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => User.t;
}

class UserRepository {
  const UserRepository._();

  Future<List<User>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<User?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<User?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<User>(
      id,
      transaction: transaction,
    );
  }

  Future<List<User>> insert(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<User>(
      rows,
      transaction: transaction,
    );
  }

  Future<User> insertRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<User>(
      row,
      transaction: transaction,
    );
  }

  Future<List<User>> update(
    _i1.Session session,
    List<User> rows, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<User>(
      rows,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  Future<User> updateRow(
    _i1.Session session,
    User row, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<User>(
      row,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<User>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<User>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<User>(
      where: where?.call(User.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

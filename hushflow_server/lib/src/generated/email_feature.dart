/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class EmailFeature extends _i1.TableRow {
  EmailFeature._({
    int? id,
    required this.emailId,
    required this.userId,
    required this.senderFrequency,
    required this.senderOpenRate,
    this.keywordVector,
    required this.hasUnsubscribeLink,
    required this.contentLength,
    required this.imageCount,
    required this.linkCount,
    required this.hourReceived,
    required this.dayOfWeek,
    this.wasOpened,
    this.wasClicked,
    this.interactionTime,
  }) : super(id);

  factory EmailFeature({
    int? id,
    required int emailId,
    required int userId,
    required int senderFrequency,
    required double senderOpenRate,
    String? keywordVector,
    required bool hasUnsubscribeLink,
    required int contentLength,
    required int imageCount,
    required int linkCount,
    required int hourReceived,
    required int dayOfWeek,
    bool? wasOpened,
    bool? wasClicked,
    int? interactionTime,
  }) = _EmailFeatureImpl;

  factory EmailFeature.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return EmailFeature(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      emailId:
          serializationManager.deserialize<int>(jsonSerialization['emailId']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      senderFrequency: serializationManager
          .deserialize<int>(jsonSerialization['senderFrequency']),
      senderOpenRate: serializationManager
          .deserialize<double>(jsonSerialization['senderOpenRate']),
      keywordVector: serializationManager
          .deserialize<String?>(jsonSerialization['keywordVector']),
      hasUnsubscribeLink: serializationManager
          .deserialize<bool>(jsonSerialization['hasUnsubscribeLink']),
      contentLength: serializationManager
          .deserialize<int>(jsonSerialization['contentLength']),
      imageCount: serializationManager
          .deserialize<int>(jsonSerialization['imageCount']),
      linkCount:
          serializationManager.deserialize<int>(jsonSerialization['linkCount']),
      hourReceived: serializationManager
          .deserialize<int>(jsonSerialization['hourReceived']),
      dayOfWeek:
          serializationManager.deserialize<int>(jsonSerialization['dayOfWeek']),
      wasOpened: serializationManager
          .deserialize<bool?>(jsonSerialization['wasOpened']),
      wasClicked: serializationManager
          .deserialize<bool?>(jsonSerialization['wasClicked']),
      interactionTime: serializationManager
          .deserialize<int?>(jsonSerialization['interactionTime']),
    );
  }

  static final t = EmailFeatureTable();

  static const db = EmailFeatureRepository._();

  int emailId;

  int userId;

  int senderFrequency;

  double senderOpenRate;

  String? keywordVector;

  bool hasUnsubscribeLink;

  int contentLength;

  int imageCount;

  int linkCount;

  int hourReceived;

  int dayOfWeek;

  bool? wasOpened;

  bool? wasClicked;

  int? interactionTime;

  @override
  _i1.Table get table => t;

  EmailFeature copyWith({
    int? id,
    int? emailId,
    int? userId,
    int? senderFrequency,
    double? senderOpenRate,
    String? keywordVector,
    bool? hasUnsubscribeLink,
    int? contentLength,
    int? imageCount,
    int? linkCount,
    int? hourReceived,
    int? dayOfWeek,
    bool? wasOpened,
    bool? wasClicked,
    int? interactionTime,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'emailId': emailId,
      'userId': userId,
      'senderFrequency': senderFrequency,
      'senderOpenRate': senderOpenRate,
      if (keywordVector != null) 'keywordVector': keywordVector,
      'hasUnsubscribeLink': hasUnsubscribeLink,
      'contentLength': contentLength,
      'imageCount': imageCount,
      'linkCount': linkCount,
      'hourReceived': hourReceived,
      'dayOfWeek': dayOfWeek,
      if (wasOpened != null) 'wasOpened': wasOpened,
      if (wasClicked != null) 'wasClicked': wasClicked,
      if (interactionTime != null) 'interactionTime': interactionTime,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'emailId': emailId,
      'userId': userId,
      'senderFrequency': senderFrequency,
      'senderOpenRate': senderOpenRate,
      'keywordVector': keywordVector,
      'hasUnsubscribeLink': hasUnsubscribeLink,
      'contentLength': contentLength,
      'imageCount': imageCount,
      'linkCount': linkCount,
      'hourReceived': hourReceived,
      'dayOfWeek': dayOfWeek,
      'wasOpened': wasOpened,
      'wasClicked': wasClicked,
      'interactionTime': interactionTime,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'emailId': emailId,
      'userId': userId,
      'senderFrequency': senderFrequency,
      'senderOpenRate': senderOpenRate,
      if (keywordVector != null) 'keywordVector': keywordVector,
      'hasUnsubscribeLink': hasUnsubscribeLink,
      'contentLength': contentLength,
      'imageCount': imageCount,
      'linkCount': linkCount,
      'hourReceived': hourReceived,
      'dayOfWeek': dayOfWeek,
      if (wasOpened != null) 'wasOpened': wasOpened,
      if (wasClicked != null) 'wasClicked': wasClicked,
      if (interactionTime != null) 'interactionTime': interactionTime,
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
      case 'emailId':
        emailId = value;
        return;
      case 'userId':
        userId = value;
        return;
      case 'senderFrequency':
        senderFrequency = value;
        return;
      case 'senderOpenRate':
        senderOpenRate = value;
        return;
      case 'keywordVector':
        keywordVector = value;
        return;
      case 'hasUnsubscribeLink':
        hasUnsubscribeLink = value;
        return;
      case 'contentLength':
        contentLength = value;
        return;
      case 'imageCount':
        imageCount = value;
        return;
      case 'linkCount':
        linkCount = value;
        return;
      case 'hourReceived':
        hourReceived = value;
        return;
      case 'dayOfWeek':
        dayOfWeek = value;
        return;
      case 'wasOpened':
        wasOpened = value;
        return;
      case 'wasClicked':
        wasClicked = value;
        return;
      case 'interactionTime':
        interactionTime = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<EmailFeature>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmailFeatureTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<EmailFeature>(
      where: where != null ? where(EmailFeature.t) : null,
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
  static Future<EmailFeature?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmailFeatureTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<EmailFeature>(
      where: where != null ? where(EmailFeature.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<EmailFeature?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<EmailFeature>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EmailFeatureTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EmailFeature>(
      where: where(EmailFeature.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    EmailFeature row, {
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
    EmailFeature row, {
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
    EmailFeature row, {
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
    _i1.WhereExpressionBuilder<EmailFeatureTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EmailFeature>(
      where: where != null ? where(EmailFeature.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static EmailFeatureInclude include() {
    return EmailFeatureInclude._();
  }

  static EmailFeatureIncludeList includeList({
    _i1.WhereExpressionBuilder<EmailFeatureTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EmailFeatureTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EmailFeatureTable>? orderByList,
    EmailFeatureInclude? include,
  }) {
    return EmailFeatureIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EmailFeature.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(EmailFeature.t),
      include: include,
    );
  }
}

class _Undefined {}

class _EmailFeatureImpl extends EmailFeature {
  _EmailFeatureImpl({
    int? id,
    required int emailId,
    required int userId,
    required int senderFrequency,
    required double senderOpenRate,
    String? keywordVector,
    required bool hasUnsubscribeLink,
    required int contentLength,
    required int imageCount,
    required int linkCount,
    required int hourReceived,
    required int dayOfWeek,
    bool? wasOpened,
    bool? wasClicked,
    int? interactionTime,
  }) : super._(
          id: id,
          emailId: emailId,
          userId: userId,
          senderFrequency: senderFrequency,
          senderOpenRate: senderOpenRate,
          keywordVector: keywordVector,
          hasUnsubscribeLink: hasUnsubscribeLink,
          contentLength: contentLength,
          imageCount: imageCount,
          linkCount: linkCount,
          hourReceived: hourReceived,
          dayOfWeek: dayOfWeek,
          wasOpened: wasOpened,
          wasClicked: wasClicked,
          interactionTime: interactionTime,
        );

  @override
  EmailFeature copyWith({
    Object? id = _Undefined,
    int? emailId,
    int? userId,
    int? senderFrequency,
    double? senderOpenRate,
    Object? keywordVector = _Undefined,
    bool? hasUnsubscribeLink,
    int? contentLength,
    int? imageCount,
    int? linkCount,
    int? hourReceived,
    int? dayOfWeek,
    Object? wasOpened = _Undefined,
    Object? wasClicked = _Undefined,
    Object? interactionTime = _Undefined,
  }) {
    return EmailFeature(
      id: id is int? ? id : this.id,
      emailId: emailId ?? this.emailId,
      userId: userId ?? this.userId,
      senderFrequency: senderFrequency ?? this.senderFrequency,
      senderOpenRate: senderOpenRate ?? this.senderOpenRate,
      keywordVector:
          keywordVector is String? ? keywordVector : this.keywordVector,
      hasUnsubscribeLink: hasUnsubscribeLink ?? this.hasUnsubscribeLink,
      contentLength: contentLength ?? this.contentLength,
      imageCount: imageCount ?? this.imageCount,
      linkCount: linkCount ?? this.linkCount,
      hourReceived: hourReceived ?? this.hourReceived,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      wasOpened: wasOpened is bool? ? wasOpened : this.wasOpened,
      wasClicked: wasClicked is bool? ? wasClicked : this.wasClicked,
      interactionTime:
          interactionTime is int? ? interactionTime : this.interactionTime,
    );
  }
}

class EmailFeatureTable extends _i1.Table {
  EmailFeatureTable({super.tableRelation})
      : super(tableName: 'email_features') {
    emailId = _i1.ColumnInt(
      'emailId',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    senderFrequency = _i1.ColumnInt(
      'senderFrequency',
      this,
    );
    senderOpenRate = _i1.ColumnDouble(
      'senderOpenRate',
      this,
    );
    keywordVector = _i1.ColumnString(
      'keywordVector',
      this,
    );
    hasUnsubscribeLink = _i1.ColumnBool(
      'hasUnsubscribeLink',
      this,
    );
    contentLength = _i1.ColumnInt(
      'contentLength',
      this,
    );
    imageCount = _i1.ColumnInt(
      'imageCount',
      this,
    );
    linkCount = _i1.ColumnInt(
      'linkCount',
      this,
    );
    hourReceived = _i1.ColumnInt(
      'hourReceived',
      this,
    );
    dayOfWeek = _i1.ColumnInt(
      'dayOfWeek',
      this,
    );
    wasOpened = _i1.ColumnBool(
      'wasOpened',
      this,
    );
    wasClicked = _i1.ColumnBool(
      'wasClicked',
      this,
    );
    interactionTime = _i1.ColumnInt(
      'interactionTime',
      this,
    );
  }

  late final _i1.ColumnInt emailId;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnInt senderFrequency;

  late final _i1.ColumnDouble senderOpenRate;

  late final _i1.ColumnString keywordVector;

  late final _i1.ColumnBool hasUnsubscribeLink;

  late final _i1.ColumnInt contentLength;

  late final _i1.ColumnInt imageCount;

  late final _i1.ColumnInt linkCount;

  late final _i1.ColumnInt hourReceived;

  late final _i1.ColumnInt dayOfWeek;

  late final _i1.ColumnBool wasOpened;

  late final _i1.ColumnBool wasClicked;

  late final _i1.ColumnInt interactionTime;

  @override
  List<_i1.Column> get columns => [
        id,
        emailId,
        userId,
        senderFrequency,
        senderOpenRate,
        keywordVector,
        hasUnsubscribeLink,
        contentLength,
        imageCount,
        linkCount,
        hourReceived,
        dayOfWeek,
        wasOpened,
        wasClicked,
        interactionTime,
      ];
}

@Deprecated('Use EmailFeatureTable.t instead.')
EmailFeatureTable tEmailFeature = EmailFeatureTable();

class EmailFeatureInclude extends _i1.IncludeObject {
  EmailFeatureInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => EmailFeature.t;
}

class EmailFeatureIncludeList extends _i1.IncludeList {
  EmailFeatureIncludeList._({
    _i1.WhereExpressionBuilder<EmailFeatureTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EmailFeature.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => EmailFeature.t;
}

class EmailFeatureRepository {
  const EmailFeatureRepository._();

  Future<List<EmailFeature>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmailFeatureTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EmailFeatureTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EmailFeatureTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<EmailFeature>(
      where: where?.call(EmailFeature.t),
      orderBy: orderBy?.call(EmailFeature.t),
      orderByList: orderByList?.call(EmailFeature.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<EmailFeature?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmailFeatureTable>? where,
    int? offset,
    _i1.OrderByBuilder<EmailFeatureTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EmailFeatureTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<EmailFeature>(
      where: where?.call(EmailFeature.t),
      orderBy: orderBy?.call(EmailFeature.t),
      orderByList: orderByList?.call(EmailFeature.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<EmailFeature?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<EmailFeature>(
      id,
      transaction: transaction,
    );
  }

  Future<List<EmailFeature>> insert(
    _i1.Session session,
    List<EmailFeature> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<EmailFeature>(
      rows,
      transaction: transaction,
    );
  }

  Future<EmailFeature> insertRow(
    _i1.Session session,
    EmailFeature row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<EmailFeature>(
      row,
      transaction: transaction,
    );
  }

  Future<List<EmailFeature>> update(
    _i1.Session session,
    List<EmailFeature> rows, {
    _i1.ColumnSelections<EmailFeatureTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<EmailFeature>(
      rows,
      columns: columns?.call(EmailFeature.t),
      transaction: transaction,
    );
  }

  Future<EmailFeature> updateRow(
    _i1.Session session,
    EmailFeature row, {
    _i1.ColumnSelections<EmailFeatureTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<EmailFeature>(
      row,
      columns: columns?.call(EmailFeature.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<EmailFeature> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<EmailFeature>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    EmailFeature row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<EmailFeature>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EmailFeatureTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<EmailFeature>(
      where: where(EmailFeature.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmailFeatureTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<EmailFeature>(
      where: where?.call(EmailFeature.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

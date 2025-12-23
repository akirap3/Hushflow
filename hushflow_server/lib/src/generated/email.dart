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

abstract class Email extends _i1.TableRow {
  Email._({
    int? id,
    required this.userId,
    required this.gmailId,
    this.threadId,
    required this.sender,
    required this.senderEmail,
    required this.subject,
    this.snippet,
    this.bodyPlain,
    this.bodyHtml,
    required this.receivedAt,
    required this.isRead,
    required this.isSubscription,
    required this.priorityScore,
    this.labels,
    this.category,
    required this.hasImages,
    this.valuableImageUrl,
    required this.createdAt,
  }) : super(id);

  factory Email({
    int? id,
    required int userId,
    required String gmailId,
    String? threadId,
    required String sender,
    required String senderEmail,
    required String subject,
    String? snippet,
    String? bodyPlain,
    String? bodyHtml,
    required DateTime receivedAt,
    required bool isRead,
    required bool isSubscription,
    required double priorityScore,
    List<String>? labels,
    String? category,
    required bool hasImages,
    String? valuableImageUrl,
    required DateTime createdAt,
  }) = _EmailImpl;

  factory Email.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Email(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      gmailId: serializationManager
          .deserialize<String>(jsonSerialization['gmailId']),
      threadId: serializationManager
          .deserialize<String?>(jsonSerialization['threadId']),
      sender:
          serializationManager.deserialize<String>(jsonSerialization['sender']),
      senderEmail: serializationManager
          .deserialize<String>(jsonSerialization['senderEmail']),
      subject: serializationManager
          .deserialize<String>(jsonSerialization['subject']),
      snippet: serializationManager
          .deserialize<String?>(jsonSerialization['snippet']),
      bodyPlain: serializationManager
          .deserialize<String?>(jsonSerialization['bodyPlain']),
      bodyHtml: serializationManager
          .deserialize<String?>(jsonSerialization['bodyHtml']),
      receivedAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['receivedAt']),
      isRead:
          serializationManager.deserialize<bool>(jsonSerialization['isRead']),
      isSubscription: serializationManager
          .deserialize<bool>(jsonSerialization['isSubscription']),
      priorityScore: serializationManager
          .deserialize<double>(jsonSerialization['priorityScore']),
      labels: serializationManager
          .deserialize<List<String>?>(jsonSerialization['labels']),
      category: serializationManager
          .deserialize<String?>(jsonSerialization['category']),
      hasImages: serializationManager
          .deserialize<bool>(jsonSerialization['hasImages']),
      valuableImageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['valuableImageUrl']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
    );
  }

  static final t = EmailTable();

  static const db = EmailRepository._();

  int userId;

  String gmailId;

  String? threadId;

  String sender;

  String senderEmail;

  String subject;

  String? snippet;

  String? bodyPlain;

  String? bodyHtml;

  DateTime receivedAt;

  bool isRead;

  bool isSubscription;

  double priorityScore;

  List<String>? labels;

  String? category;

  bool hasImages;

  String? valuableImageUrl;

  DateTime createdAt;

  @override
  _i1.Table get table => t;

  Email copyWith({
    int? id,
    int? userId,
    String? gmailId,
    String? threadId,
    String? sender,
    String? senderEmail,
    String? subject,
    String? snippet,
    String? bodyPlain,
    String? bodyHtml,
    DateTime? receivedAt,
    bool? isRead,
    bool? isSubscription,
    double? priorityScore,
    List<String>? labels,
    String? category,
    bool? hasImages,
    String? valuableImageUrl,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'gmailId': gmailId,
      if (threadId != null) 'threadId': threadId,
      'sender': sender,
      'senderEmail': senderEmail,
      'subject': subject,
      if (snippet != null) 'snippet': snippet,
      if (bodyPlain != null) 'bodyPlain': bodyPlain,
      if (bodyHtml != null) 'bodyHtml': bodyHtml,
      'receivedAt': receivedAt.toJson(),
      'isRead': isRead,
      'isSubscription': isSubscription,
      'priorityScore': priorityScore,
      if (labels != null) 'labels': labels?.toJson(),
      if (category != null) 'category': category,
      'hasImages': hasImages,
      if (valuableImageUrl != null) 'valuableImageUrl': valuableImageUrl,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'userId': userId,
      'gmailId': gmailId,
      'threadId': threadId,
      'sender': sender,
      'senderEmail': senderEmail,
      'subject': subject,
      'snippet': snippet,
      'bodyPlain': bodyPlain,
      'bodyHtml': bodyHtml,
      'receivedAt': receivedAt,
      'isRead': isRead,
      'isSubscription': isSubscription,
      'priorityScore': priorityScore,
      'labels': labels,
      'category': category,
      'hasImages': hasImages,
      'valuableImageUrl': valuableImageUrl,
      'createdAt': createdAt,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'gmailId': gmailId,
      if (threadId != null) 'threadId': threadId,
      'sender': sender,
      'senderEmail': senderEmail,
      'subject': subject,
      if (snippet != null) 'snippet': snippet,
      if (bodyPlain != null) 'bodyPlain': bodyPlain,
      if (bodyHtml != null) 'bodyHtml': bodyHtml,
      'receivedAt': receivedAt.toJson(),
      'isRead': isRead,
      'isSubscription': isSubscription,
      'priorityScore': priorityScore,
      if (labels != null) 'labels': labels?.toJson(),
      if (category != null) 'category': category,
      'hasImages': hasImages,
      if (valuableImageUrl != null) 'valuableImageUrl': valuableImageUrl,
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
      case 'gmailId':
        gmailId = value;
        return;
      case 'threadId':
        threadId = value;
        return;
      case 'sender':
        sender = value;
        return;
      case 'senderEmail':
        senderEmail = value;
        return;
      case 'subject':
        subject = value;
        return;
      case 'snippet':
        snippet = value;
        return;
      case 'bodyPlain':
        bodyPlain = value;
        return;
      case 'bodyHtml':
        bodyHtml = value;
        return;
      case 'receivedAt':
        receivedAt = value;
        return;
      case 'isRead':
        isRead = value;
        return;
      case 'isSubscription':
        isSubscription = value;
        return;
      case 'priorityScore':
        priorityScore = value;
        return;
      case 'labels':
        labels = value;
        return;
      case 'category':
        category = value;
        return;
      case 'hasImages':
        hasImages = value;
        return;
      case 'valuableImageUrl':
        valuableImageUrl = value;
        return;
      case 'createdAt':
        createdAt = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<Email>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmailTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Email>(
      where: where != null ? where(Email.t) : null,
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
  static Future<Email?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmailTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Email>(
      where: where != null ? where(Email.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<Email?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Email>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EmailTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Email>(
      where: where(Email.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    Email row, {
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
    Email row, {
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
    Email row, {
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
    _i1.WhereExpressionBuilder<EmailTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Email>(
      where: where != null ? where(Email.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static EmailInclude include() {
    return EmailInclude._();
  }

  static EmailIncludeList includeList({
    _i1.WhereExpressionBuilder<EmailTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EmailTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EmailTable>? orderByList,
    EmailInclude? include,
  }) {
    return EmailIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Email.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Email.t),
      include: include,
    );
  }
}

class _Undefined {}

class _EmailImpl extends Email {
  _EmailImpl({
    int? id,
    required int userId,
    required String gmailId,
    String? threadId,
    required String sender,
    required String senderEmail,
    required String subject,
    String? snippet,
    String? bodyPlain,
    String? bodyHtml,
    required DateTime receivedAt,
    required bool isRead,
    required bool isSubscription,
    required double priorityScore,
    List<String>? labels,
    String? category,
    required bool hasImages,
    String? valuableImageUrl,
    required DateTime createdAt,
  }) : super._(
          id: id,
          userId: userId,
          gmailId: gmailId,
          threadId: threadId,
          sender: sender,
          senderEmail: senderEmail,
          subject: subject,
          snippet: snippet,
          bodyPlain: bodyPlain,
          bodyHtml: bodyHtml,
          receivedAt: receivedAt,
          isRead: isRead,
          isSubscription: isSubscription,
          priorityScore: priorityScore,
          labels: labels,
          category: category,
          hasImages: hasImages,
          valuableImageUrl: valuableImageUrl,
          createdAt: createdAt,
        );

  @override
  Email copyWith({
    Object? id = _Undefined,
    int? userId,
    String? gmailId,
    Object? threadId = _Undefined,
    String? sender,
    String? senderEmail,
    String? subject,
    Object? snippet = _Undefined,
    Object? bodyPlain = _Undefined,
    Object? bodyHtml = _Undefined,
    DateTime? receivedAt,
    bool? isRead,
    bool? isSubscription,
    double? priorityScore,
    Object? labels = _Undefined,
    Object? category = _Undefined,
    bool? hasImages,
    Object? valuableImageUrl = _Undefined,
    DateTime? createdAt,
  }) {
    return Email(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      gmailId: gmailId ?? this.gmailId,
      threadId: threadId is String? ? threadId : this.threadId,
      sender: sender ?? this.sender,
      senderEmail: senderEmail ?? this.senderEmail,
      subject: subject ?? this.subject,
      snippet: snippet is String? ? snippet : this.snippet,
      bodyPlain: bodyPlain is String? ? bodyPlain : this.bodyPlain,
      bodyHtml: bodyHtml is String? ? bodyHtml : this.bodyHtml,
      receivedAt: receivedAt ?? this.receivedAt,
      isRead: isRead ?? this.isRead,
      isSubscription: isSubscription ?? this.isSubscription,
      priorityScore: priorityScore ?? this.priorityScore,
      labels: labels is List<String>? ? labels : this.labels?.clone(),
      category: category is String? ? category : this.category,
      hasImages: hasImages ?? this.hasImages,
      valuableImageUrl: valuableImageUrl is String?
          ? valuableImageUrl
          : this.valuableImageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class EmailTable extends _i1.Table {
  EmailTable({super.tableRelation}) : super(tableName: 'emails') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    gmailId = _i1.ColumnString(
      'gmailId',
      this,
    );
    threadId = _i1.ColumnString(
      'threadId',
      this,
    );
    sender = _i1.ColumnString(
      'sender',
      this,
    );
    senderEmail = _i1.ColumnString(
      'senderEmail',
      this,
    );
    subject = _i1.ColumnString(
      'subject',
      this,
    );
    snippet = _i1.ColumnString(
      'snippet',
      this,
    );
    bodyPlain = _i1.ColumnString(
      'bodyPlain',
      this,
    );
    bodyHtml = _i1.ColumnString(
      'bodyHtml',
      this,
    );
    receivedAt = _i1.ColumnDateTime(
      'receivedAt',
      this,
    );
    isRead = _i1.ColumnBool(
      'isRead',
      this,
    );
    isSubscription = _i1.ColumnBool(
      'isSubscription',
      this,
    );
    priorityScore = _i1.ColumnDouble(
      'priorityScore',
      this,
    );
    labels = _i1.ColumnSerializable(
      'labels',
      this,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
    hasImages = _i1.ColumnBool(
      'hasImages',
      this,
    );
    valuableImageUrl = _i1.ColumnString(
      'valuableImageUrl',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString gmailId;

  late final _i1.ColumnString threadId;

  late final _i1.ColumnString sender;

  late final _i1.ColumnString senderEmail;

  late final _i1.ColumnString subject;

  late final _i1.ColumnString snippet;

  late final _i1.ColumnString bodyPlain;

  late final _i1.ColumnString bodyHtml;

  late final _i1.ColumnDateTime receivedAt;

  late final _i1.ColumnBool isRead;

  late final _i1.ColumnBool isSubscription;

  late final _i1.ColumnDouble priorityScore;

  late final _i1.ColumnSerializable labels;

  late final _i1.ColumnString category;

  late final _i1.ColumnBool hasImages;

  late final _i1.ColumnString valuableImageUrl;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        gmailId,
        threadId,
        sender,
        senderEmail,
        subject,
        snippet,
        bodyPlain,
        bodyHtml,
        receivedAt,
        isRead,
        isSubscription,
        priorityScore,
        labels,
        category,
        hasImages,
        valuableImageUrl,
        createdAt,
      ];
}

@Deprecated('Use EmailTable.t instead.')
EmailTable tEmail = EmailTable();

class EmailInclude extends _i1.IncludeObject {
  EmailInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Email.t;
}

class EmailIncludeList extends _i1.IncludeList {
  EmailIncludeList._({
    _i1.WhereExpressionBuilder<EmailTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Email.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Email.t;
}

class EmailRepository {
  const EmailRepository._();

  Future<List<Email>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmailTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EmailTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EmailTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<Email>(
      where: where?.call(Email.t),
      orderBy: orderBy?.call(Email.t),
      orderByList: orderByList?.call(Email.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Email?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmailTable>? where,
    int? offset,
    _i1.OrderByBuilder<EmailTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EmailTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<Email>(
      where: where?.call(Email.t),
      orderBy: orderBy?.call(Email.t),
      orderByList: orderByList?.call(Email.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Email?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<Email>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Email>> insert(
    _i1.Session session,
    List<Email> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<Email>(
      rows,
      transaction: transaction,
    );
  }

  Future<Email> insertRow(
    _i1.Session session,
    Email row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<Email>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Email>> update(
    _i1.Session session,
    List<Email> rows, {
    _i1.ColumnSelections<EmailTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<Email>(
      rows,
      columns: columns?.call(Email.t),
      transaction: transaction,
    );
  }

  Future<Email> updateRow(
    _i1.Session session,
    Email row, {
    _i1.ColumnSelections<EmailTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<Email>(
      row,
      columns: columns?.call(Email.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<Email> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<Email>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    Email row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<Email>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EmailTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<Email>(
      where: where(Email.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmailTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<Email>(
      where: where?.call(Email.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

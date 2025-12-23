/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Sender extends _i1.SerializableEntity {
  Sender._({
    this.id,
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
  });

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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

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

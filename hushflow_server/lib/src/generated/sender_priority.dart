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

abstract class SenderPriority extends _i1.SerializableEntity {
  SenderPriority._({
    required this.email,
    required this.name,
    required this.maxScore,
    required this.latestSnippet,
    required this.latestReceivedAt,
    required this.emailCount,
    required this.isWhitelisted,
  });

  factory SenderPriority({
    required String email,
    required String name,
    required double maxScore,
    required String latestSnippet,
    required DateTime latestReceivedAt,
    required int emailCount,
    required bool isWhitelisted,
  }) = _SenderPriorityImpl;

  factory SenderPriority.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return SenderPriority(
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      maxScore: serializationManager
          .deserialize<double>(jsonSerialization['maxScore']),
      latestSnippet: serializationManager
          .deserialize<String>(jsonSerialization['latestSnippet']),
      latestReceivedAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['latestReceivedAt']),
      emailCount: serializationManager
          .deserialize<int>(jsonSerialization['emailCount']),
      isWhitelisted: serializationManager
          .deserialize<bool>(jsonSerialization['isWhitelisted']),
    );
  }

  String email;

  String name;

  double maxScore;

  String latestSnippet;

  DateTime latestReceivedAt;

  int emailCount;

  bool isWhitelisted;

  SenderPriority copyWith({
    String? email,
    String? name,
    double? maxScore,
    String? latestSnippet,
    DateTime? latestReceivedAt,
    int? emailCount,
    bool? isWhitelisted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'maxScore': maxScore,
      'latestSnippet': latestSnippet,
      'latestReceivedAt': latestReceivedAt.toJson(),
      'emailCount': emailCount,
      'isWhitelisted': isWhitelisted,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'email': email,
      'name': name,
      'maxScore': maxScore,
      'latestSnippet': latestSnippet,
      'latestReceivedAt': latestReceivedAt.toJson(),
      'emailCount': emailCount,
      'isWhitelisted': isWhitelisted,
    };
  }
}

class _SenderPriorityImpl extends SenderPriority {
  _SenderPriorityImpl({
    required String email,
    required String name,
    required double maxScore,
    required String latestSnippet,
    required DateTime latestReceivedAt,
    required int emailCount,
    required bool isWhitelisted,
  }) : super._(
          email: email,
          name: name,
          maxScore: maxScore,
          latestSnippet: latestSnippet,
          latestReceivedAt: latestReceivedAt,
          emailCount: emailCount,
          isWhitelisted: isWhitelisted,
        );

  @override
  SenderPriority copyWith({
    String? email,
    String? name,
    double? maxScore,
    String? latestSnippet,
    DateTime? latestReceivedAt,
    int? emailCount,
    bool? isWhitelisted,
  }) {
    return SenderPriority(
      email: email ?? this.email,
      name: name ?? this.name,
      maxScore: maxScore ?? this.maxScore,
      latestSnippet: latestSnippet ?? this.latestSnippet,
      latestReceivedAt: latestReceivedAt ?? this.latestReceivedAt,
      emailCount: emailCount ?? this.emailCount,
      isWhitelisted: isWhitelisted ?? this.isWhitelisted,
    );
  }
}

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

abstract class SenderCandidate extends _i1.SerializableEntity {
  SenderCandidate._({
    required this.email,
    this.name,
    required this.isSubscription,
    required this.subscriptionSignals,
    required this.emailCount,
  });

  factory SenderCandidate({
    required String email,
    String? name,
    required bool isSubscription,
    required List<String> subscriptionSignals,
    required int emailCount,
  }) = _SenderCandidateImpl;

  factory SenderCandidate.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return SenderCandidate(
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      name:
          serializationManager.deserialize<String?>(jsonSerialization['name']),
      isSubscription: serializationManager
          .deserialize<bool>(jsonSerialization['isSubscription']),
      subscriptionSignals: serializationManager
          .deserialize<List<String>>(jsonSerialization['subscriptionSignals']),
      emailCount: serializationManager
          .deserialize<int>(jsonSerialization['emailCount']),
    );
  }

  String email;

  String? name;

  bool isSubscription;

  List<String> subscriptionSignals;

  int emailCount;

  SenderCandidate copyWith({
    String? email,
    String? name,
    bool? isSubscription,
    List<String>? subscriptionSignals,
    int? emailCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      if (name != null) 'name': name,
      'isSubscription': isSubscription,
      'subscriptionSignals': subscriptionSignals.toJson(),
      'emailCount': emailCount,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'email': email,
      if (name != null) 'name': name,
      'isSubscription': isSubscription,
      'subscriptionSignals': subscriptionSignals.toJson(),
      'emailCount': emailCount,
    };
  }
}

class _Undefined {}

class _SenderCandidateImpl extends SenderCandidate {
  _SenderCandidateImpl({
    required String email,
    String? name,
    required bool isSubscription,
    required List<String> subscriptionSignals,
    required int emailCount,
  }) : super._(
          email: email,
          name: name,
          isSubscription: isSubscription,
          subscriptionSignals: subscriptionSignals,
          emailCount: emailCount,
        );

  @override
  SenderCandidate copyWith({
    String? email,
    Object? name = _Undefined,
    bool? isSubscription,
    List<String>? subscriptionSignals,
    int? emailCount,
  }) {
    return SenderCandidate(
      email: email ?? this.email,
      name: name is String? ? name : this.name,
      isSubscription: isSubscription ?? this.isSubscription,
      subscriptionSignals:
          subscriptionSignals ?? this.subscriptionSignals.clone(),
      emailCount: emailCount ?? this.emailCount,
    );
  }
}

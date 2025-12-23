/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'email.dart' as _i2;
import 'email_feature.dart' as _i3;
import 'example.dart' as _i4;
import 'exclusion.dart' as _i5;
import 'ml_model.dart' as _i6;
import 'sender.dart' as _i7;
import 'summary.dart' as _i8;
import 'summary_item.dart' as _i9;
import 'unsubscribe_queue.dart' as _i10;
import 'user.dart' as _i11;
import 'webhook_log.dart' as _i12;
export 'email.dart';
export 'email_feature.dart';
export 'example.dart';
export 'exclusion.dart';
export 'ml_model.dart';
export 'sender.dart';
export 'summary.dart';
export 'summary_item.dart';
export 'unsubscribe_queue.dart';
export 'user.dart';
export 'webhook_log.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.Email) {
      return _i2.Email.fromJson(data, this) as T;
    }
    if (t == _i3.EmailFeature) {
      return _i3.EmailFeature.fromJson(data, this) as T;
    }
    if (t == _i4.Example) {
      return _i4.Example.fromJson(data, this) as T;
    }
    if (t == _i5.Exclusion) {
      return _i5.Exclusion.fromJson(data, this) as T;
    }
    if (t == _i6.MlModel) {
      return _i6.MlModel.fromJson(data, this) as T;
    }
    if (t == _i7.Sender) {
      return _i7.Sender.fromJson(data, this) as T;
    }
    if (t == _i8.Summary) {
      return _i8.Summary.fromJson(data, this) as T;
    }
    if (t == _i9.SummaryItem) {
      return _i9.SummaryItem.fromJson(data, this) as T;
    }
    if (t == _i10.UnsubscribeQueue) {
      return _i10.UnsubscribeQueue.fromJson(data, this) as T;
    }
    if (t == _i11.User) {
      return _i11.User.fromJson(data, this) as T;
    }
    if (t == _i12.WebhookLog) {
      return _i12.WebhookLog.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Email?>()) {
      return (data != null ? _i2.Email.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.EmailFeature?>()) {
      return (data != null ? _i3.EmailFeature.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.Example?>()) {
      return (data != null ? _i4.Example.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.Exclusion?>()) {
      return (data != null ? _i5.Exclusion.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.MlModel?>()) {
      return (data != null ? _i6.MlModel.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i7.Sender?>()) {
      return (data != null ? _i7.Sender.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i8.Summary?>()) {
      return (data != null ? _i8.Summary.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i9.SummaryItem?>()) {
      return (data != null ? _i9.SummaryItem.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i10.UnsubscribeQueue?>()) {
      return (data != null ? _i10.UnsubscribeQueue.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i11.User?>()) {
      return (data != null ? _i11.User.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i12.WebhookLog?>()) {
      return (data != null ? _i12.WebhookLog.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<dynamic>(v))) as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<Map<String, dynamic>>) {
      return (data as List)
          .map((e) => deserialize<Map<String, dynamic>>(e))
          .toList() as dynamic;
    }
    if (t == _i1.getType<Map<String, dynamic>?>()) {
      return (data != null
          ? (data as Map).map((k, v) =>
              MapEntry(deserialize<String>(k), deserialize<dynamic>(v)))
          : null) as dynamic;
    }
    if (t == _i1.getType<Map<String, dynamic>?>()) {
      return (data != null
          ? (data as Map).map((k, v) =>
              MapEntry(deserialize<String>(k), deserialize<dynamic>(v)))
          : null) as dynamic;
    }
    if (t == _i1.getType<Map<String, dynamic>?>()) {
      return (data != null
          ? (data as Map).map((k, v) =>
              MapEntry(deserialize<String>(k), deserialize<dynamic>(v)))
          : null) as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Email) {
      return 'Email';
    }
    if (data is _i3.EmailFeature) {
      return 'EmailFeature';
    }
    if (data is _i4.Example) {
      return 'Example';
    }
    if (data is _i5.Exclusion) {
      return 'Exclusion';
    }
    if (data is _i6.MlModel) {
      return 'MlModel';
    }
    if (data is _i7.Sender) {
      return 'Sender';
    }
    if (data is _i8.Summary) {
      return 'Summary';
    }
    if (data is _i9.SummaryItem) {
      return 'SummaryItem';
    }
    if (data is _i10.UnsubscribeQueue) {
      return 'UnsubscribeQueue';
    }
    if (data is _i11.User) {
      return 'User';
    }
    if (data is _i12.WebhookLog) {
      return 'WebhookLog';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Email') {
      return deserialize<_i2.Email>(data['data']);
    }
    if (data['className'] == 'EmailFeature') {
      return deserialize<_i3.EmailFeature>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i4.Example>(data['data']);
    }
    if (data['className'] == 'Exclusion') {
      return deserialize<_i5.Exclusion>(data['data']);
    }
    if (data['className'] == 'MlModel') {
      return deserialize<_i6.MlModel>(data['data']);
    }
    if (data['className'] == 'Sender') {
      return deserialize<_i7.Sender>(data['data']);
    }
    if (data['className'] == 'Summary') {
      return deserialize<_i8.Summary>(data['data']);
    }
    if (data['className'] == 'SummaryItem') {
      return deserialize<_i9.SummaryItem>(data['data']);
    }
    if (data['className'] == 'UnsubscribeQueue') {
      return deserialize<_i10.UnsubscribeQueue>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i11.User>(data['data']);
    }
    if (data['className'] == 'WebhookLog') {
      return deserialize<_i12.WebhookLog>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}

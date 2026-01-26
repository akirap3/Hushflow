/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class SummaryDetails extends _i1.SerializableEntity {
  SummaryDetails._({
    required this.summary,
    required this.items,
  });

  factory SummaryDetails({
    required _i2.Summary summary,
    required List<_i2.SummaryItem> items,
  }) = _SummaryDetailsImpl;

  factory SummaryDetails.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return SummaryDetails(
      summary: serializationManager
          .deserialize<_i2.Summary>(jsonSerialization['summary']),
      items: serializationManager
          .deserialize<List<_i2.SummaryItem>>(jsonSerialization['items']),
    );
  }

  _i2.Summary summary;

  List<_i2.SummaryItem> items;

  SummaryDetails copyWith({
    _i2.Summary? summary,
    List<_i2.SummaryItem>? items,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'summary': summary.toJson(),
      'items': items.toJson(valueToJson: (v) => v.toJson()),
    };
  }
}

class _SummaryDetailsImpl extends SummaryDetails {
  _SummaryDetailsImpl({
    required _i2.Summary summary,
    required List<_i2.SummaryItem> items,
  }) : super._(
          summary: summary,
          items: items,
        );

  @override
  SummaryDetails copyWith({
    _i2.Summary? summary,
    List<_i2.SummaryItem>? items,
  }) {
    return SummaryDetails(
      summary: summary ?? this.summary.copyWith(),
      items: items ?? this.items.clone(),
    );
  }
}

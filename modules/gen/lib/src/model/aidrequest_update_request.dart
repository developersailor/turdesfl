import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'aidrequest_update_request.g.dart';

@JsonSerializable()
@immutable
class AidrequestUpdateRequest extends INetworkModel<AidrequestUpdateRequest> {
  const AidrequestUpdateRequest({
    this.message,
  });
  final String? message;

  @override
  AidrequestUpdateRequest fromJson(Map<String, dynamic> json) =>
      _$AidrequestUpdateRequestFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$AidrequestUpdateRequestToJson(this);
}

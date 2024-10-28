import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'aidrequest_response.g.dart';

@JsonSerializable()
@immutable
class AidrequestResponse extends INetworkModel<AidrequestResponse> {
  const AidrequestResponse({
    this.id,
    this.type,
    this.description,
    this.status,
    this.organizationId,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });
  final int? id;
  final String? type;
  final String? description;
  final String? status;
  final int? organizationId;
  final int? userId;
  final String? createdAt;
  final String? updatedAt;
  @override
  AidrequestResponse fromJson(Map<String, dynamic> json) =>
      _$AidrequestResponseFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$AidrequestResponseToJson(this);
}

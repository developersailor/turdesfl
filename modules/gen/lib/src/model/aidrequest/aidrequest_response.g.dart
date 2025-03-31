// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aidrequest_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AidrequestResponse _$AidrequestResponseFromJson(Map<String, dynamic> json) =>
    AidrequestResponse(
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      organizationId: (json['organizationId'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      document: json['document'] as String?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$AidrequestResponseToJson(AidrequestResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'organizationId': instance.organizationId,
      'userId': instance.userId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'document': instance.document,
      'photo': instance.photo,
    };

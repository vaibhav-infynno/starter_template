// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ValidateTokenModel _$ValidateTokenModelFromJson(Map<String, dynamic> json) =>
    _ValidateTokenModel(
      status: (json['status'] as num?)?.toInt(),
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ValidateTokenModelToJson(_ValidateTokenModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
    };

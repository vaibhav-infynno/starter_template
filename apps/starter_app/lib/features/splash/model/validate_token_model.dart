// To parse this JSON data, do
//
//     final validateTokenModel = validateTokenModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'validate_token_model.freezed.dart';
part 'validate_token_model.g.dart';

ValidateTokenModel validateTokenModelFromJson(String str) =>
    ValidateTokenModel.fromJson(json.decode(str));

String validateTokenModelToJson(ValidateTokenModel data) =>
    json.encode(data.toJson());

@freezed
abstract class ValidateTokenModel with _$ValidateTokenModel {
  const factory ValidateTokenModel({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "message") String? message,
  }) = _ValidateTokenModel;

  factory ValidateTokenModel.fromJson(Map<String, dynamic> json) =>
      _$ValidateTokenModelFromJson(json);
}

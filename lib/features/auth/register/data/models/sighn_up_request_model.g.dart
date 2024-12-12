// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sighn_up_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SighnUpRequestModel _$SighnUpRequestModelFromJson(Map<String, dynamic> json) =>
    SighnUpRequestModel(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$SighnUpRequestModelToJson(
        SighnUpRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'avatar': instance.avatar,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRoleModel _$UserRoleModelFromJson(Map<String, dynamic> json) =>
    UserRoleModel(
      userId: (json['id'] as num).toInt(),
      userRole: json['role'] as String,
    );

Map<String, dynamic> _$UserRoleModelToJson(UserRoleModel instance) =>
    <String, dynamic>{
      'id': instance.userId,
      'role': instance.userRole,
    };

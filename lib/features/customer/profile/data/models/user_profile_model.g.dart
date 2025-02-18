// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      userId: (json['id'] as num?)?.toInt(),
      userName: json['name'] as String?,
      userEmail: json['email'] as String?,
      userAvatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'id': instance.userId,
      'name': instance.userName,
      'email': instance.userEmail,
      'avatar': instance.userAvatar,
    };

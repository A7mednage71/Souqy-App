// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersResponseModel _$GetUsersResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetUsersResponseModel(
      usersData:
          GetUsersDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUsersResponseModelToJson(
        GetUsersResponseModel instance) =>
    <String, dynamic>{
      'data': instance.usersData,
    };

GetUsersDataModel _$GetUsersDataModelFromJson(Map<String, dynamic> json) =>
    GetUsersDataModel(
      users: (json['users'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUsersDataModelToJson(GetUsersDataModel instance) =>
    <String, dynamic>{
      'users': instance.users,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['id'] as String,
      userName: json['name'] as String,
      userEmail: json['email'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.userId,
      'name': instance.userName,
      'email': instance.userEmail,
    };

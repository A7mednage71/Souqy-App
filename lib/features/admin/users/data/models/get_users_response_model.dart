import 'package:json_annotation/json_annotation.dart';

part 'get_users_response_model.g.dart';

@JsonSerializable()
class GetUsersResponseModel {
  GetUsersResponseModel({required this.usersData});

  factory GetUsersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetUsersResponseModelFromJson(json);

  @JsonKey(name: 'data')
  final GetUsersDataModel usersData;

  Map<String, dynamic> toJson() => _$GetUsersResponseModelToJson(this);
}

@JsonSerializable()
class GetUsersDataModel {
  GetUsersDataModel({required this.users});

  factory GetUsersDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetUsersDataModelFromJson(json);

  final List<UserModel> users;

  Map<String, dynamic> toJson() => _$GetUsersDataModelToJson(this);
}

@JsonSerializable()
class UserModel {
  UserModel({
    required this.userId,
    required this.userName,
    required this.userEmail,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @JsonKey(name: 'id')
  final String userId;
  @JsonKey(name: 'name')
  final String userName;
  @JsonKey(name: 'email')
  final String userEmail;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

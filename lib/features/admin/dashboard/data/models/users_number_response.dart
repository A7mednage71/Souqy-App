import 'package:json_annotation/json_annotation.dart';

part 'users_number_response.g.dart';

@JsonSerializable()
class UsersNumberResponse {
  UsersNumberResponse({required this.data});

  factory UsersNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersNumberResponseFromJson(json);

  final UsersNumberData data;
}

@JsonSerializable()
class UsersNumberData {
  UsersNumberData({required this.usersList});

  factory UsersNumberData.fromJson(Map<String, dynamic> json) =>
      _$UsersNumberDataFromJson(json);

  @JsonKey(name: 'users')
  final List<UserNumberModel> usersList;
}

@JsonSerializable()
class UserNumberModel {
  UserNumberModel({required this.name});

  factory UserNumberModel.fromJson(Map<String, dynamic> json) =>
      _$UserNumberModelFromJson(json);

  final String name;
}

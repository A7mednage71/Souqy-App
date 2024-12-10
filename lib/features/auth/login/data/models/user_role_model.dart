import 'package:json_annotation/json_annotation.dart';

part 'user_role_model.g.dart';

@JsonSerializable()
class UserRoleModel {
  UserRoleModel({required this.userId, required this.userRole});

  factory UserRoleModel.fromJson(Map<String, dynamic> json) =>
      _$UserRoleModelFromJson(json);

  @JsonKey(name: 'id')
  final int userId;

  @JsonKey(name: 'role')
  final String userRole;
}

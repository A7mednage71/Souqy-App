import 'package:json_annotation/json_annotation.dart';

part 'user_profile_model.g.dart';

@JsonSerializable()
class UserProfileModel {
  UserProfileModel({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userAvatar,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  @JsonKey(name: 'id')
  final int? userId;

  @JsonKey(name: 'name')
  final String? userName;

  @JsonKey(name: 'email')
  final String? userEmail;

  @JsonKey(name: 'avatar')
  final String? userAvatar;

  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);
}

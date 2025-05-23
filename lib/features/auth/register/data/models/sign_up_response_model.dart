import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response_model.g.dart';
@JsonSerializable()
class SignUpResponseModel {
  SignUpResponseModel({
    required this.sighnUpdate,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);

  @JsonKey(name: 'data')
  final SighnUpDateModel sighnUpdate;
}

@JsonSerializable()
class SighnUpDateModel {
  SighnUpDateModel({required this.addUser});

  factory SighnUpDateModel.fromJson(Map<String, dynamic> json) =>
      _$SighnUpDateModelFromJson(json);

  final AddUserModel? addUser;
}

@JsonSerializable()
class AddUserModel {
  AddUserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.role,
  });

  factory AddUserModel.fromJson(Map<String, dynamic> json) =>
      _$AddUserModelFromJson(json);
  final String id;
  final String email;
  final String name;
  final String avatar;
  final String role;
}

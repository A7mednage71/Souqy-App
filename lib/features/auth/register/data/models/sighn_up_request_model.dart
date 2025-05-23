import 'package:json_annotation/json_annotation.dart';

part 'sighn_up_request_model.g.dart';

@JsonSerializable()
class SighnUpRequestModel {
  SighnUpRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
  });

  factory SighnUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SighnUpRequestModelFromJson(json);
  final String name;
  final String email;
  final String password;
  final String avatar;
}

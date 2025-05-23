import 'package:json_annotation/json_annotation.dart';

part 'create_category_response_model.g.dart';
@JsonSerializable()
class CreateCategoryResponseModel {
  CreateCategoryResponseModel(this.data);

  factory CreateCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryResponseModelFromJson(json);

  final CreateCategoryData data;

  Map<String, dynamic> toJson() => _$CreateCategoryResponseModelToJson(this);
}

@JsonSerializable()
class CreateCategoryData {
  CreateCategoryData(this.addCategory);

  factory CreateCategoryData.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryDataFromJson(json);

  final CreateAddCategory addCategory;

  Map<String, dynamic> toJson() => _$CreateCategoryDataToJson(this);
}

@JsonSerializable()
class CreateAddCategory {
  CreateAddCategory(this.id, this.name, this.image);

  factory CreateAddCategory.fromJson(Map<String, dynamic> json) =>
      _$CreateAddCategoryFromJson(json);
  final String id;
  final String name;
  final String image;

  Map<String, dynamic> toJson() => _$CreateAddCategoryToJson(this);
}

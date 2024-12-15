import 'package:json_annotation/json_annotation.dart';

part 'categories_number_response.g.dart';

@JsonSerializable()
class CategoriesNumberResponse {
  CategoriesNumberResponse({required this.data});

  factory CategoriesNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesNumberResponseFromJson(json);

  final CategoriesNumberData data;

  String get numberofcategories {
    if (data.categoriesList.isEmpty) {
      return '0';
    }
    return data.categoriesList.length.toString();
  }
}

@JsonSerializable()
class CategoriesNumberData {
  CategoriesNumberData({required this.categoriesList});

  factory CategoriesNumberData.fromJson(Map<String, dynamic> json) =>
      _$CategoriesNumberDataFromJson(json);

  @JsonKey(name: 'categories')
  final List<CategoryNumberModel> categoriesList;
}

@JsonSerializable()
class CategoryNumberModel {
  CategoryNumberModel({required this.categoryName});

  factory CategoryNumberModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryNumberModelFromJson(json);

  @JsonKey(name: 'name')
  final String categoryName;
}

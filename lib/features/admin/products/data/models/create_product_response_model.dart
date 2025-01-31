import 'package:json_annotation/json_annotation.dart';

part 'create_product_response_model.g.dart';

@JsonSerializable()
class CreateProductResponseModel {
  CreateProductResponseModel({
    required this.data,
  });

  factory CreateProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateProductResponseModelFromJson(json);

  final CreateProductResponseData data;

  Map<String, dynamic> toJson() => _$CreateProductResponseModelToJson(this);
}

@JsonSerializable()
class CreateProductResponseData {
  CreateProductResponseData({
    required this.addProduct,
  });

  factory CreateProductResponseData.fromJson(Map<String, dynamic> json) =>
      _$CreateProductResponseDataFromJson(json);

  final AddProductModel addProduct;

  Map<String, dynamic> toJson() => _$CreateProductResponseDataToJson(this);
}

@JsonSerializable()
class AddProductModel {
  AddProductModel(this.category, {required this.title});

  factory AddProductModel.fromJson(Map<String, dynamic> json) =>
      _$AddProductModelFromJson(json);

  final String title;
  final AddProductCategory category;
  Map<String, dynamic> toJson() => _$AddProductModelToJson(this);
}

@JsonSerializable()
class AddProductCategory {
  AddProductCategory({required this.name});

  factory AddProductCategory.fromJson(Map<String, dynamic> json) =>
      _$AddProductCategoryFromJson(json);

  final String name;

  Map<String, dynamic> toJson() => _$AddProductCategoryToJson(this);
}

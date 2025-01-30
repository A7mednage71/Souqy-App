import 'package:json_annotation/json_annotation.dart';

part 'products_response_model.g.dart';

@JsonSerializable()
class ProductsResponseModel {
  ProductsResponseModel({required this.data});

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseModelFromJson(json);

  final ProductsResponseData data;

  Map<String, dynamic> toJson() => _$ProductsResponseModelToJson(this);
}

@JsonSerializable()
class ProductsResponseData {
  ProductsResponseData({required this.products});

  factory ProductsResponseData.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseDataFromJson(json);

  final List<ProductModel> products;

  Map<String, dynamic> toJson() => _$ProductsResponseDataToJson(this);
}

@JsonSerializable()
class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  final String? id;
  final String? title;
  final int? price;
  final String? description;
  final List<String>? images;
  final ProductCategory? category;

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ProductCategory {
  ProductCategory({required this.id, required this.name});

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);

  final String? id;
  final String? name;

  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);
}

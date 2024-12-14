import 'package:json_annotation/json_annotation.dart';

part 'products_number_response.g.dart';

@JsonSerializable()
class ProductsNumberResponse {
  ProductsNumberResponse({required this.data});

  factory ProductsNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsNumberResponseFromJson(json);

  final ProductsNumberData data;
}

@JsonSerializable()
class ProductsNumberData {
  ProductsNumberData({required this.productsList});

  factory ProductsNumberData.fromJson(Map<String, dynamic> json) =>
      _$ProductsNumberDataFromJson(json);

  @JsonKey(name: 'products')
  final List<ProductNumberModel> productsList;
}

@JsonSerializable()
class ProductNumberModel {
  ProductNumberModel({required this.title});

  factory ProductNumberModel.fromJson(Map<String, dynamic> json) =>
      _$ProductNumberModelFromJson(json);

  final String title;
}

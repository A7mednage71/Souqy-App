import 'package:json_annotation/json_annotation.dart';

part 'update_product_response_model.g.dart';

@JsonSerializable()
class UpdateProductResponseModel {
  UpdateProductResponseModel({
    required this.data,
  });

  factory UpdateProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductResponseModelFromJson(json);

  final UpdateProductResponseData data;

  Map<String, dynamic> toJson() => _$UpdateProductResponseModelToJson(this);
}

@JsonSerializable()
class UpdateProductResponseData {
  UpdateProductResponseData({
    required this.updateProduct,
  });

  factory UpdateProductResponseData.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductResponseDataFromJson(json);

  final UpdateProductModel updateProduct;

  Map<String, dynamic> toJson() => _$UpdateProductResponseDataToJson(this);
}

@JsonSerializable()
class UpdateProductModel {
  UpdateProductModel({required this.title});

  factory UpdateProductModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductModelFromJson(json);

  final String title;

  Map<String, dynamic> toJson() => _$UpdateProductModelToJson(this);
}

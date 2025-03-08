import 'package:json_annotation/json_annotation.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
part 'get_specific_product_response.g.dart';
@JsonSerializable()
class GetSpecificProductResponseModel {
  GetSpecificProductResponseModel({required this.data});

  factory GetSpecificProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetSpecificProductResponseModelFromJson(json);

  final GetSpecificProductDataModel data;

  Map<String, dynamic> toJson() =>
      _$GetSpecificProductResponseModelToJson(this);
}

@JsonSerializable()
class GetSpecificProductDataModel {
  GetSpecificProductDataModel({
    required this.product,
  });

  factory GetSpecificProductDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetSpecificProductDataModelFromJson(json);
  final ProductModel product;

  Map<String, dynamic> toJson() => _$GetSpecificProductDataModelToJson(this);
}

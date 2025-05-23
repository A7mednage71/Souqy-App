import 'package:json_annotation/json_annotation.dart';

part 'update_product_request_model.g.dart';

@JsonSerializable()
class UpdateProductRequestModel {
  UpdateProductRequestModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.categoryId,
  });

  factory UpdateProductRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductRequestModelFromJson(json);

  final String id;
  final String title;
  final String description;
  final int price;
  final List<String> images;
  final int categoryId;

  Map<String, dynamic> toJson() => _$UpdateProductRequestModelToJson(this);
}

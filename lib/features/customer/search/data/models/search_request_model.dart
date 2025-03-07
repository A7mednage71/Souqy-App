import 'package:json_annotation/json_annotation.dart';

part 'search_request_model.g.dart';

@JsonSerializable()
class SearchRequestModel {
  SearchRequestModel({
    required this.productName,
    required this.minPrice,
    required this.maxPrice,
  });

  final String? productName;
  final String? minPrice;
  final String? maxPrice;

  Map<String, dynamic> toJson() => _$SearchRequestModelToJson(this);
}

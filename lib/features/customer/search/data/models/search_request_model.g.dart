// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRequestModel _$SearchRequestModelFromJson(Map<String, dynamic> json) =>
    SearchRequestModel(
      productName: json['productName'] as String?,
      minPrice: json['minPrice'] as String?,
      maxPrice: json['maxPrice'] as String?,
    );

Map<String, dynamic> _$SearchRequestModelToJson(SearchRequestModel instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
    };

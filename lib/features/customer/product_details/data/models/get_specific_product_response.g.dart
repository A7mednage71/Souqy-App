// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_specific_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSpecificProductResponseModel _$GetSpecificProductResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetSpecificProductResponseModel(
      data: GetSpecificProductDataModel.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSpecificProductResponseModelToJson(
        GetSpecificProductResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GetSpecificProductDataModel _$GetSpecificProductDataModelFromJson(
        Map<String, dynamic> json) =>
    GetSpecificProductDataModel(
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSpecificProductDataModelToJson(
        GetSpecificProductDataModel instance) =>
    <String, dynamic>{
      'product': instance.product,
    };

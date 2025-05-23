// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_product_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProductResponseModel _$UpdateProductResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdateProductResponseModel(
      data: UpdateProductResponseData.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateProductResponseModelToJson(
        UpdateProductResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UpdateProductResponseData _$UpdateProductResponseDataFromJson(
        Map<String, dynamic> json) =>
    UpdateProductResponseData(
      updateProduct: UpdateProductModel.fromJson(
          json['updateProduct'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateProductResponseDataToJson(
        UpdateProductResponseData instance) =>
    <String, dynamic>{
      'updateProduct': instance.updateProduct,
    };

UpdateProductModel _$UpdateProductModelFromJson(Map<String, dynamic> json) =>
    UpdateProductModel(
      title: json['title'] as String,
    );

Map<String, dynamic> _$UpdateProductModelToJson(UpdateProductModel instance) =>
    <String, dynamic>{
      'title': instance.title,
    };

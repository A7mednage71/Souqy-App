// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductResponseModel _$CreateProductResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreateProductResponseModel(
      data: CreateProductResponseData.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateProductResponseModelToJson(
        CreateProductResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CreateProductResponseData _$CreateProductResponseDataFromJson(
        Map<String, dynamic> json) =>
    CreateProductResponseData(
      addProduct:
          AddProductModel.fromJson(json['addProduct'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateProductResponseDataToJson(
        CreateProductResponseData instance) =>
    <String, dynamic>{
      'addProduct': instance.addProduct,
    };

AddProductModel _$AddProductModelFromJson(Map<String, dynamic> json) =>
    AddProductModel(
      title: json['title'] as String,
    );

Map<String, dynamic> _$AddProductModelToJson(AddProductModel instance) =>
    <String, dynamic>{
      'title': instance.title,
    };

AddProductCategory _$AddProductCategoryFromJson(Map<String, dynamic> json) =>
    AddProductCategory(
      name: json['name'] as String,
    );

Map<String, dynamic> _$AddProductCategoryToJson(AddProductCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

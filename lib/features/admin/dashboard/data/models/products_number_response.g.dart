// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsNumberResponse _$ProductsNumberResponseFromJson(
        Map<String, dynamic> json) =>
    ProductsNumberResponse(
      data: ProductsNumberData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsNumberResponseToJson(
        ProductsNumberResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductsNumberData _$ProductsNumberDataFromJson(Map<String, dynamic> json) =>
    ProductsNumberData(
      productsList: (json['products'] as List<dynamic>)
          .map((e) => ProductNumberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsNumberDataToJson(ProductsNumberData instance) =>
    <String, dynamic>{
      'products': instance.productsList,
    };

ProductNumberModel _$ProductNumberModelFromJson(Map<String, dynamic> json) =>
    ProductNumberModel(
      title: json['title'] as String,
    );

Map<String, dynamic> _$ProductNumberModelToJson(ProductNumberModel instance) =>
    <String, dynamic>{
      'title': instance.title,
    };

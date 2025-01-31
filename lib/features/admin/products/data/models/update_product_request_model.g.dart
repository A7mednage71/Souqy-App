// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_product_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProductRequestModel _$UpdateProductRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdateProductRequestModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toInt(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      categoryId: (json['categoryId'] as num).toInt(),
    );

Map<String, dynamic> _$UpdateProductRequestModelToJson(
        UpdateProductRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'images': instance.images,
      'categoryId': instance.categoryId,
    };

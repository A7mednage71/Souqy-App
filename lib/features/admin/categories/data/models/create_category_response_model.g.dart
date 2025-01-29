// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCategoryResponseModel _$CreateCategoryResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreateCategoryResponseModel(
      CreateCategoryData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateCategoryResponseModelToJson(
        CreateCategoryResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CreateCategoryData _$CreateCategoryDataFromJson(Map<String, dynamic> json) =>
    CreateCategoryData(
      CreateAddCategory.fromJson(json['addCategory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateCategoryDataToJson(CreateCategoryData instance) =>
    <String, dynamic>{
      'addCategory': instance.addCategory,
    };

CreateAddCategory _$CreateAddCategoryFromJson(Map<String, dynamic> json) =>
    CreateAddCategory(
      json['id'] as String,
      json['name'] as String,
      json['image'] as String,
    );

Map<String, dynamic> _$CreateAddCategoryToJson(CreateAddCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

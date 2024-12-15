// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesNumberResponse _$CategoriesNumberResponseFromJson(
        Map<String, dynamic> json) =>
    CategoriesNumberResponse(
      data: CategoriesNumberData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoriesNumberResponseToJson(
        CategoriesNumberResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CategoriesNumberData _$CategoriesNumberDataFromJson(
        Map<String, dynamic> json) =>
    CategoriesNumberData(
      categoriesList: (json['categories'] as List<dynamic>)
          .map((e) => CategoryNumberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesNumberDataToJson(
        CategoriesNumberData instance) =>
    <String, dynamic>{
      'categories': instance.categoriesList,
    };

CategoryNumberModel _$CategoryNumberModelFromJson(Map<String, dynamic> json) =>
    CategoryNumberModel(
      categoryName: json['name'] as String,
    );

Map<String, dynamic> _$CategoryNumberModelToJson(
        CategoryNumberModel instance) =>
    <String, dynamic>{
      'name': instance.categoryName,
    };

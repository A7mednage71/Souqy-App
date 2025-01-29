import 'package:dio/dio.dart';
import 'package:my_store/core/networking/api_error.dart';
import 'package:my_store/core/networking/api_result.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/core/networking/graph_queries/admin/categories/categories_guery.dart';
import 'package:my_store/features/admin/categories/data/models/categories_response_model.dart';
import 'package:my_store/features/admin/categories/data/models/create_category_request_model.dart';
import 'package:my_store/features/admin/categories/data/models/create_category_response_model.dart';

class CategoriesRepo {
  CategoriesRepo(this._apiService);
  final ApiService _apiService;
  Future<ApiResult<CategoriesResponseModel>> getCategories() async {
    try {
      final response =
          await _apiService.getCategories(CategoriesGuery.getCategoriesQuery());
      return ApiResult.success(response);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  Future<ApiResult<CreateCategoryResponseModel>> createCategory({
    required CreateCategoryRequestModel createCategoryModel,
  }) async {
    try {
      final response = await _apiService.createCategory(
        CategoriesGuery.createCategoryQuery(
          model: createCategoryModel,
        ),
      );
      return ApiResult.success(response);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  Future<ApiResult<void>> deleteCategory({required String id}) async {
    try {
      final response = await _apiService.deleteCategory(
        CategoriesGuery.deleteCategoryQuery(id: id),
      );
      return ApiResult.success(response);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }
}

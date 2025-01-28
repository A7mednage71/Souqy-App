import 'package:dio/dio.dart';
import 'package:my_store/core/networking/api_error.dart';
import 'package:my_store/core/networking/api_result.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/core/networking/graph_queries/admin/categories/categories_guery.dart';
import 'package:my_store/features/admin/categories/data/models/categories_response_model.dart';

class CategoriesRepo {
  CategoriesRepo(this._apiService);
  final ApiService _apiService;
  Future<ApiResult<CategoriesResponseModel>> getCategories() async {
    try {
      final response =
          await _apiService.getCategories(CategoriesGuery.categoriesQuery());
      return ApiResult.success(response);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }
}

import 'package:dio/dio.dart';
import 'package:my_store/core/networking/api_error.dart';
import 'package:my_store/core/networking/api_result.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/core/networking/graph_queries/admin/dashboard/dashboard_queries.dart';
import 'package:my_store/features/admin/dashboard/data/models/categories_number_response.dart';
import 'package:my_store/features/admin/dashboard/data/models/products_number_response.dart';
import 'package:my_store/features/admin/dashboard/data/models/users_number_response.dart';

class DashboardRepo {
  const DashboardRepo(this._apiService);

  final ApiService _apiService;

  // number of products
  Future<ApiResult<ProductsNumberResponse>> numberOfProducts() async {
    try {
      final result =
          await _apiService.numberOfProducts(DashboardQueries.productsQuery());
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  // number of categories
  Future<ApiResult<CategoriesNumberResponse>> numberOfCategories() async {
    try {
      final result = await _apiService
          .numberOfCategories(DashboardQueries.categoriesQuery());
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  // number of users
  Future<ApiResult<UsersNumberResponse>> numberOfUsers() async {
    try {
      final result =
          await _apiService.numberOfUsers(DashboardQueries.usersQuery());
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }
}

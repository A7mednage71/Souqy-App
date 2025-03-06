import 'package:dio/dio.dart';
import 'package:my_store/core/networking/api_error.dart';
import 'package:my_store/core/networking/api_result.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/core/networking/graph_queries/admin/products/products_query.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';

class CategoryProductsRepo {
  CategoryProductsRepo(this._apiService);
  final ApiService _apiService;

  Future<ApiResult<ProductsResponseModel>> getProductsByCategory(
    int categoryId,
  ) async {
    try {
      final response = await _apiService.getAllProducts(
        ProductsQuery.getCategorySpecificProducts(id: categoryId),
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

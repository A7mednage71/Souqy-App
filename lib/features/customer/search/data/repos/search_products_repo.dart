import 'package:dio/dio.dart';
import 'package:my_store/core/networking/api_error.dart';
import 'package:my_store/core/networking/api_result.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/core/networking/graph_queries/admin/search/search_queries.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/customer/search/data/models/search_request_model.dart';

class SearchProductsRepo {
  SearchProductsRepo(this._apiService);
  final ApiService _apiService;

  Future<ApiResult<ProductsResponseModel>> searchProducts(
    SearchRequestModel model,
  ) async {
    try {
      final response = await _apiService.getAllProducts(
        SearchQueries.searchProductsQuery(model: model),
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

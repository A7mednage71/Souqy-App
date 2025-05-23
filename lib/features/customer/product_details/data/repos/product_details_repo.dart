import 'package:dio/dio.dart';
import 'package:my_store/core/networking/api_error.dart';
import 'package:my_store/core/networking/api_result.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/core/networking/graph_queries/admin/products/products_query.dart';
import 'package:my_store/features/customer/product_details/data/models/get_specific_product_response.dart';

class ProductDetailsRepo {
  ProductDetailsRepo(this._apiService);
  final ApiService _apiService;

  Future<ApiResult<GetSpecificProductResponseModel>> getProduct({
    required String productId,
  }) async {
    try {
      final response = await _apiService
          .getSpecificProduct(ProductsQuery.productQuery(id: productId));
      return ApiResult.success(response);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }
}

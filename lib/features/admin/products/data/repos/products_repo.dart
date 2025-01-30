import 'package:dio/dio.dart';
import 'package:my_store/core/networking/api_error.dart';
import 'package:my_store/core/networking/api_result.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';

class ProductsRepo {
  ProductsRepo(this._apiService);

  final ApiService _apiService;

  Future<ApiResult<ProductsResponseModel>> getAllProducts() async {
    try {
      final result = await _apiService.getAllProducts({});
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }
}

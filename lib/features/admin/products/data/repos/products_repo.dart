import 'package:dio/dio.dart';
import 'package:my_store/core/networking/api_error.dart';
import 'package:my_store/core/networking/api_result.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/core/networking/graph_queries/admin/products/products_query.dart';
import 'package:my_store/features/admin/products/data/models/create_product_request_model.dart';
import 'package:my_store/features/admin/products/data/models/create_product_response_model.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/admin/products/data/models/update_product_request_model.dart';
import 'package:my_store/features/admin/products/data/models/update_product_response_model.dart';

class ProductsRepo {
  ProductsRepo(this._apiService);

  final ApiService _apiService;

  Future<ApiResult<ProductsResponseModel>> getAllProducts() async {
    try {
      final result =
          await _apiService.getAllProducts(ProductsQuery.allProductsQuery());
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  Future<ApiResult<CreateProductResponseModel>> createProduct({
    required CreateProductRequestModel model,
  }) async {
    try {
      final result = await _apiService
          .createProduct(ProductsQuery.createProductQuery(model: model));
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  Future<ApiResult<void>> deleteProduct({
    required String productId,
  }) async {
    try {
      final result = await _apiService
          .deleteProduct(ProductsQuery.deleteProductQuery(id: productId));
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  Future<ApiResult<UpdateProductResponseModel>> updateProduct({
    required UpdateProductRequestModel model,
  }) async {
    try {
      final result = await _apiService.updateProduct(
        ProductsQuery.updateProductQuery(product: model),
      );
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }
}

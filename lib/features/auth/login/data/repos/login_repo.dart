import 'package:dio/dio.dart';
import 'package:my_store/core/networking/api_error.dart';
import 'package:my_store/core/networking/api_result.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/core/networking/graph_queries/auth/login_query.dart';
import 'package:my_store/features/auth/login/data/models/login_request_model.dart';
import 'package:my_store/features/auth/login/data/models/login_response_model.dart';

class LoginRepo {
  LoginRepo(this._apiService);

  final ApiService _apiService;

  Future<ApiResult<LoginResponseModel>> login({
    required LoginRequestModel loginRequest,
  }) async {
    try {
      final result =
          await _apiService.login(LoginQuery.loginQuery(model: loginRequest));
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }
}

import 'package:dio/dio.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/networking/api_error.dart';
import 'package:my_store/core/networking/api_result.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/core/networking/graph_queries/auth/sign_up_query.dart';
import 'package:my_store/features/auth/register/data/models/sighn_up_request_model.dart';
import 'package:my_store/features/auth/register/data/models/sign_up_response_model.dart';

class SighnUpRepo {
  SighnUpRepo(this._apiService);

  final ApiService _apiService;

  Future<ApiResult<SignUpResponseModel>> sighnUp({
    required SighnUpRequestModel requestModel,
  }) async {
    try {
      final result = await _apiService
          .sighnUp(SignUpQuery.signUpQuery(model: requestModel));
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(LocalizationKeys.signUpError));
    }
  }
}

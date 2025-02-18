import 'package:dio/dio.dart';
import 'package:my_store/core/networking/api_error.dart';
import 'package:my_store/core/networking/api_result.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/features/customer/profile/data/models/user_profile_model.dart';

class ProfileRepo {
  ProfileRepo(this._apiService);
  final ApiService _apiService;

  Future<ApiResult<UserProfileModel>> getUserProfile() async {
    try {
      final result = await _apiService.getUserProfle();
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }
}

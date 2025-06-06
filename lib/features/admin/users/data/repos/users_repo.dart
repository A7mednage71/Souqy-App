import 'package:dio/dio.dart';
import 'package:my_store/core/networking/api_error.dart';
import 'package:my_store/core/networking/api_result.dart';
import 'package:my_store/core/networking/api_service.dart';
import 'package:my_store/core/networking/graph_queries/admin/users/users_query.dart';
import 'package:my_store/features/admin/users/data/models/get_users_response_model.dart';

class UsersRepo {
  UsersRepo(this._apiService);

  final ApiService _apiService;

  Future<ApiResult<GetUsersResponseModel>> getUsers() async {
    try {
      final result = await _apiService.getUsers(UsersQuery.getUsersQuery());
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  Future<ApiResult<void>> deleteUser({required String userId}) async {
    try {
      final result =
          await _apiService.deleteUser(UsersQuery.deleteUserQuery(id: userId));
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }
}

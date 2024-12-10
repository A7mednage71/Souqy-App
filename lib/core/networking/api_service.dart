import 'package:dio/dio.dart';
import 'package:my_store/core/networking/api_constants.dart';
import 'package:my_store/features/auth/login/data/models/login_response_model.dart';
import 'package:my_store/features/auth/login/data/models/user_role_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.graphQl)
  Future<LoginResponseModel> login(
    @Body() Map<String, dynamic> body,
  );

  @GET(ApiConstants.userPorfile)
  Future<UserRoleModel> userRole();
}

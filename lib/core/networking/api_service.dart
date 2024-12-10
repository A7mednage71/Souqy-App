import 'package:dio/dio.dart';
import 'package:my_store/core/networking/api_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.graphQl)
  Future<void> login(
    @Body() Map<String, dynamic> body,
  );

  @GET(ApiConstants.userPorfile)
  Future<void> userRole();
}

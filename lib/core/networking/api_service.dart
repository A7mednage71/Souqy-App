import 'package:dio/dio.dart';
import 'package:my_store/core/app/upload_image/models/upload_image_model.dart';
import 'package:my_store/core/networking/api_constants.dart';
import 'package:my_store/features/admin/categories/data/models/categories_response_model.dart';
import 'package:my_store/features/admin/categories/data/models/create_category_response_model.dart';
import 'package:my_store/features/admin/dashboard/data/models/categories_number_response.dart';
import 'package:my_store/features/admin/dashboard/data/models/products_number_response.dart';
import 'package:my_store/features/admin/dashboard/data/models/users_number_response.dart';
import 'package:my_store/features/admin/products/data/models/create_product_response_model.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/admin/products/data/models/update_product_response_model.dart';
import 'package:my_store/features/admin/users/data/models/get_users_response_model.dart';
import 'package:my_store/features/auth/login/data/models/login_response_model.dart';
import 'package:my_store/features/auth/login/data/models/user_role_model.dart';
import 'package:my_store/features/auth/register/data/models/sign_up_response_model.dart';
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

  @POST(ApiConstants.graphQl)
  Future<SignUpResponseModel> sighnUp(
    @Body() Map<String, dynamic> body,
  );

  @GET(ApiConstants.userPorfile)
  Future<UserRoleModel> userRole();

  @POST(ApiConstants.uploadImage)
  Future<UploadImageModel> uploadImage(
    @Body() FormData file,
  );

  @POST(ApiConstants.graphQl)
  Future<ProductsNumberResponse> numberOfProducts(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiConstants.graphQl)
  Future<CategoriesNumberResponse> numberOfCategories(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiConstants.graphQl)
  Future<UsersNumberResponse> numberOfUsers(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiConstants.graphQl)
  Future<CategoriesResponseModel> getCategories(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiConstants.graphQl)
  Future<CreateCategoryResponseModel> createCategory(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiConstants.graphQl)
  Future<void> deleteCategory(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiConstants.graphQl)
  Future<void> updateCategory(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiConstants.graphQl)
  Future<ProductsResponseModel> getAllProducts(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiConstants.graphQl)
  Future<CreateProductResponseModel> createProduct(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiConstants.graphQl)
  Future<void> deleteProduct(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiConstants.graphQl)
  Future<UpdateProductResponseModel> updateProduct(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiConstants.graphQl)
  Future<GetUsersResponseModel> getUsers(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiConstants.graphQl)
  Future<void> deleteUser(
    @Body() Map<String, dynamic> body,
  );
}

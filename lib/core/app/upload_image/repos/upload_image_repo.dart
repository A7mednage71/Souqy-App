import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_store/core/app/upload_image/models/upload_image_model.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/networking/api_error.dart';
import 'package:my_store/core/networking/api_result.dart';
import 'package:my_store/core/networking/api_service.dart';

class UploadImageRepo {
  UploadImageRepo(this._apiService);
  final ApiService _apiService;

  Future<ApiResult<UploadImageModel>> uploadImage({required XFile file}) async {
    try {
      // convert image to formdata
      final formdata = await convertImageToFormData(file);
      // upload it to the server
      final result = await _apiService.uploadImage(formdata);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(LocalizationKeys.imageError));
    }
  }

  Future<FormData> convertImageToFormData(XFile file) async {
    final formdata = FormData();
    formdata.files
        .add(MapEntry('file', await MultipartFile.fromFile(file.path)));
    return formdata;
  }
}

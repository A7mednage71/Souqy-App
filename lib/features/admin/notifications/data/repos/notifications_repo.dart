import 'package:dio/dio.dart';
import 'package:my_store/core/networking/api_error.dart';
import 'package:my_store/core/networking/api_result.dart';
import 'package:my_store/core/services/cloud_messaging/firebase_messaging_helper.dart';
import 'package:my_store/features/admin/notifications/data/models/notification_model.dart';

class NotificationsRepo {
  Future<ApiResult<void>> sendNotification({
    required NotificationModel model,
  }) async {
    try {
      final result =
          await FirebaseMessagingHelper.instance.sendNotificationsToTopic(
        title: model.title,
        notificationBody: model.body,
        productId: model.productId.toString(),
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

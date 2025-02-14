part of 'get_notifications_bloc.dart';

@freezed
class GetNotificationsState with _$GetNotificationsState {
  const factory GetNotificationsState.initial() = _Initial;
  const factory GetNotificationsState.loading() = _Loading;
  const factory GetNotificationsState.success(
    List<AddNotificationModel> notifications,
  ) = _Success;
  const factory GetNotificationsState.failure(String message) = _Failure;
}

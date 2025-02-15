part of 'add_notifications_bloc.dart';

@freezed
class AddNotificationsState with _$AddNotificationsState {
  const factory AddNotificationsState.initial() = _Initial;
  const factory AddNotificationsState.loading() = _Loading;
  const factory AddNotificationsState.success() = _Success;
  const factory AddNotificationsState.failure(String message) = _Failure;
}

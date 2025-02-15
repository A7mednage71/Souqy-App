part of 'send_notification_bloc.dart';

@freezed
class SendNotificationState with _$SendNotificationState {
  const factory SendNotificationState.initial() = _Initial;
  const factory SendNotificationState.loading({
    required int loadingAtIndex,
  }) = _Loading;
  const factory SendNotificationState.success() = _Success;
  const factory SendNotificationState.failure(String message) = _Failure;
}

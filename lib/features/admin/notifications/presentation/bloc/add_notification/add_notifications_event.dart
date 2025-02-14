part of 'add_notifications_bloc.dart';

@freezed
class AddNotificationsEvent with _$AddNotificationsEvent {
  const factory AddNotificationsEvent.started() = _Started;
  const factory AddNotificationsEvent.addNotification() = AddNotification;
}

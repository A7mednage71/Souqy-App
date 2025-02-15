import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/notifications/data/models/notification_model.dart';
import 'package:my_store/features/admin/notifications/data/repos/notifications_repo.dart';

part 'send_notification_bloc.freezed.dart';
part 'send_notification_event.dart';
part 'send_notification_state.dart';

class SendNotificationBloc
    extends Bloc<SendNotificationEvent, SendNotificationState> {
  SendNotificationBloc(this._notificationsRepo)
      : super(const SendNotificationState.initial()) {
    on<SendNotification>(sendNotification);
  }

  final NotificationsRepo _notificationsRepo;

  FutureOr<void> sendNotification(
    SendNotification event,
    Emitter<SendNotificationState> emit,
  ) async {
    emit(SendNotificationState.loading(loadingAtIndex: event.loadingAtIndex));
    try {
      await _notificationsRepo.sendNotification(
        model: event.model,
      );
      emit(const SendNotificationState.success());
    } catch (e) {
      emit(SendNotificationState.failure(e.toString()));
    }
  }
}

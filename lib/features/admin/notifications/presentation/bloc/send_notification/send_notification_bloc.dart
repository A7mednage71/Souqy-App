import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/extensions/date_extension.dart';
import 'package:my_store/features/admin/notifications/data/models/notification_model.dart';
import 'package:my_store/features/admin/notifications/data/repos/notifications_repo.dart';
import 'package:my_store/features/customer/notifications/data/models/customer_notification_model.dart';
import 'package:uuid/uuid.dart';

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
      await _notificationsRepo.addNotificationToFirebase(
        model: CustomerNotificationModel(
          notificationId: const Uuid().v4(),
          title: event.model.title,
          body: event.model.body,
          productId: event.model.productId.toString(),
          createdAt: event.model.createdAt.convertDataFormate(),
          isSeen: false,
        ),
      );
      emit(const SendNotificationState.success());
    } catch (e) {
      emit(SendNotificationState.failure(e.toString()));
    }
  }
}

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/services/hive_database/hive_database.dart';
import 'package:my_store/features/admin/notifications/data/models/add_notification_model.dart';

part 'get_notifications_bloc.freezed.dart';
part 'get_notifications_event.dart';
part 'get_notifications_state.dart';

class GetNotificationsBloc
    extends Bloc<GetNotificationsEvent, GetNotificationsState> {
  GetNotificationsBloc() : super(const GetNotificationsState.initial()) {
    on<GetNotifications>(getNotifications);
  }

  FutureOr<void> getNotifications(
    GetNotifications event,
    Emitter<GetNotificationsState> emit,
  ) {
    emit(const GetNotificationsState.loading());
    try {
      final notifications = HiveDatabase.notificationsBox!.values.toList();
      emit(GetNotificationsState.success(notifications));
    } catch (e) {
      emit(GetNotificationsState.failure(e.toString()));
    }
  }
}

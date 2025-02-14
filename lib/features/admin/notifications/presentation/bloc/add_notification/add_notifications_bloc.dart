import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/services/hive_database/hive_database.dart';
import 'package:my_store/features/admin/notifications/data/models/add_notification_model.dart';

part 'add_notifications_bloc.freezed.dart';
part 'add_notifications_event.dart';
part 'add_notifications_state.dart';

class AddNotificationsBloc
    extends Bloc<AddNotificationsEvent, AddNotificationsState> {
  AddNotificationsBloc() : super(const AddNotificationsState.initial()) {
    on<AddNotification>(addNotification);
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController notificationTitle = TextEditingController();
  TextEditingController notificationBody = TextEditingController();
  TextEditingController productId = TextEditingController();

  FutureOr<void> addNotification(
    AddNotification event,
    Emitter<AddNotificationsState> emit,
  ) {
    emit(const AddNotificationsState.loading());
    try {
      HiveDatabase.notificationsBox!.add(
        AddNotificationModel(
          title: notificationTitle.text,
          body: notificationBody.text,
          productId: int.parse(productId.text),
          createdAt: DateTime.now(),
        ),
      );
      emit(const AddNotificationsState.success());
    } catch (e) {
      emit(AddNotificationsState.failure(e.toString()));
    }
  }
}

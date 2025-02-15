import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/admin/notifications/data/models/notification_model.dart';
import 'package:my_store/features/admin/notifications/presentation/bloc/get_notifications/get_notifications_bloc.dart';

class DeleteNotificationItem extends StatelessWidget {
  const DeleteNotificationItem({
    required this.notification,
    super.key,
  });
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await notification.delete();
        if (context.mounted) {
          context.read<GetNotificationsBloc>().add(
                const GetNotificationsEvent.getNotifications(),
              );
        }
      },
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
      ),
    );
  }
}

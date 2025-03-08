import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/features/admin/notifications/data/models/notification_model.dart';
import 'package:my_store/features/admin/notifications/presentation/bloc/get_notifications/get_notifications_bloc.dart';
import 'package:my_store/features/admin/notifications/presentation/views/widgets/edit_notification_bottom_sheet.dart';

class EditNotificationItem extends StatelessWidget {
  const EditNotificationItem({
    required this.notification,
    super.key,
  });

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showEditNotificationBottomSheet(context, notification);
      },
      icon: const Icon(
        Icons.edit,
        color: Colors.yellow,
      ),
    );
  }

  void showEditNotificationBottomSheet(
    BuildContext context,
    NotificationModel notification,
  ) {
    // ignore: inference_failure_on_function_invocation
    showModalBottomSheet(
      context: context,
      backgroundColor: context.themeColors.bottomSheetBackground,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      builder: (context) {
        return EditNotificationBottomSheet(notification: notification);
      },
    ).whenComplete(() {
      if (context.mounted) {
        context.read<GetNotificationsBloc>().add(
              const GetNotificationsEvent.getNotifications(),
            );
      }
    });
  }
}

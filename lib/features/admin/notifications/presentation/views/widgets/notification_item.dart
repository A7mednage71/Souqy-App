import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_container_with_gradient.dart';
import 'package:my_store/core/extensions/date_extension.dart';
import 'package:my_store/features/admin/notifications/data/models/notification_model.dart';
import 'package:my_store/features/admin/notifications/presentation/views/widgets/delete_notification_item.dart';
import 'package:my_store/features/admin/notifications/presentation/views/widgets/edit_notification_item.dart';
import 'package:my_store/features/admin/notifications/presentation/views/widgets/notification_item_row_text.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({required this.notification, super.key});
  final NotificationModel notification;
  @override
  Widget build(BuildContext context) {
    return CustomContainerWithGradient(
      height: 180.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            NotificatonItemRowText(
              title: 'Title',
              body: notification.title,
            ),
            const Spacer(),
            NotificatonItemRowText(
              title: 'Body',
              body: notification.body,
            ),
            const Spacer(),
            NotificatonItemRowText(
              title: 'Created At',
              body: notification.createdAt.getFormat(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 DeleteNotificationItem(
                  notification: notification,
                ),
                EditNotificationItem(
                  notification: notification,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

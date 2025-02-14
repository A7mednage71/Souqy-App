import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_container_with_gradient.dart';
import 'package:my_store/features/admin/notifications/presentation/widgets/edit_notification_item.dart';
import 'package:my_store/features/admin/notifications/presentation/widgets/notification_item_row_text.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

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
            const NotificatonItemRowText(
              title: 'Title',
              body: 'Big Offers Souqy Store %50',
            ),
            const Spacer(),
            const NotificatonItemRowText(
              title: 'Body',
              body: 'Ramdan Kareem we have big offer go now',
            ),
            const Spacer(),
            const NotificatonItemRowText(
              title: 'Created At',
              body: '16-02-2024',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                const EditNotificationItem(),
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

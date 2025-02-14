import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_container_with_gradient.dart';
import 'package:my_store/features/admin/notifications/presentation/widgets/notification_item_row_text.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithGradient(
      height: 200.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NotificatonItemRowText(
              title: 'Title',
              body: 'Big Offers Souqy Store %50',
            ),
            SizedBox(height: 20.h),
            const NotificatonItemRowText(
              title: 'Body',
              body: 'Ramdan Kareem we have big offer go now',
            ),
            SizedBox(height: 20.h),
            const NotificatonItemRowText(
              title: 'Created At',
              body: '16-02-2024',
            ),
            SizedBox(height: 10.h),
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
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.yellow,
                  ),
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

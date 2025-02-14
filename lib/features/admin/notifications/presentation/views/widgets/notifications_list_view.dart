import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/admin/notifications/presentation/views/widgets/notification_item.dart';

class NotificationsListView extends StatelessWidget {
  const NotificationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: index == 0 ? 0 : 20.h),
          child: const NotificationItem(),
        );
      },
    );
  }
}

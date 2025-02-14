import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_admin_appbar.dart';
import 'package:my_store/features/admin/notifications/presentation/widgets/add_notification_item.dart';
import 'package:my_store/features/admin/notifications/presentation/widgets/notifications_list_view.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAdminAppBar(title: 'Notifications'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: Column(
          children: [
            const AddNotificationItem(),
            SizedBox(height: 20.h),
            const Expanded(child: NotificationsListView()),
          ],
        ),
      ),
    );
  }
}

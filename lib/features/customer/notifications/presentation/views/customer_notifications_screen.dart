import 'package:flutter/material.dart';
import 'package:my_store/features/customer/notifications/presentation/views/widgets/customer_notification_item.dart';

class CustomerNotificationsScreen extends StatelessWidget {
  const CustomerNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => const CustomerNotificationItem(),
    );
  }
}

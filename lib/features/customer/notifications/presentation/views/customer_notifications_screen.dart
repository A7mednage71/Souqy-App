import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_store/core/common/screens/empty_data.dart';
import 'package:my_store/core/common/screens/failure_state.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/features/customer/notifications/data/models/customer_notification_model.dart';
import 'package:my_store/features/customer/notifications/data/repos/customer_notifications_repo.dart';
import 'package:my_store/features/customer/notifications/presentation/views/widgets/customer_notification_item.dart';

class CustomerNotificationsScreen extends StatelessWidget {
  const CustomerNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CustomerNotificationModel>>(
      stream: CustomerNotificationsRepo.getNotificationsStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SpinKitCircle(
              color: context.themeColors.bluePinkDark,
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: EmptyData());
        }

        if (snapshot.hasError) {
          return const Center(child: FailureState());
        }

        final notifications = snapshot.data!;

        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: notifications.length,
          itemBuilder: (context, index) =>
              CustomerNotificationItem(notificationModel: notifications[index]),
        );
      },
    );
  }
}

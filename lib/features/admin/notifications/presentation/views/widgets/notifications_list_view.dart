import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_store/core/common/screens/empty_data.dart';
import 'package:my_store/core/common/screens/failure_state.dart';
import 'package:my_store/features/admin/notifications/presentation/bloc/get_notifications/get_notifications_bloc.dart';
import 'package:my_store/features/admin/notifications/presentation/views/widgets/notification_item.dart';

class NotificationsListView extends StatelessWidget {
  const NotificationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotificationsBloc, GetNotificationsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () {
            return Center(
              child: SpinKitDualRing(
                color: Colors.white,
                size: 20.r,
              ),
            );
          },
          success: (notifications) {
            if (notifications.isEmpty) {
              return const EmptyData(message: 'No notifications');
            }
            return ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: index == 0 ? 0 : 20.h),
                  child: NotificationItem(notification: notifications[index]),
                );
              },
            );
          },
          failure: (message) {
            return const FailureState();
          },
        );
      },
    );
  }
}

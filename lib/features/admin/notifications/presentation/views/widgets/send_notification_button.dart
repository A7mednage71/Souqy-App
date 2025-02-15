import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_store/features/admin/notifications/data/models/notification_model.dart';
import 'package:my_store/features/admin/notifications/presentation/bloc/send_notification/send_notification_bloc.dart';
import 'package:my_store/features/auth/widgets/show_toast.dart';

class SendNotificationButton extends StatelessWidget {
  const SendNotificationButton({
    required this.notification,
    required this.index,
    super.key,
  });
  final NotificationModel notification;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendNotificationBloc, SendNotificationState>(
      listener: (context, state) {
        state.whenOrNull(
          failure: (message) {
            ShowToast.showFailureToast(
              message,
            );
          },
          success: () {
            ShowToast.showSuccessToast(
              'Notification sent successfully',
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (index) {
            if (index == this.index) {
              return IconButton(
                onPressed: null,
                icon: SpinKitDualRing(
                  color: Colors.white,
                  size: 20.r,
                ),
              );
            }
            return const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.send,
                color: Colors.green,
              ),
            );
          },
          orElse: () {
            return IconButton(
              onPressed: () {
                context.read<SendNotificationBloc>().add(
                      SendNotificationEvent.sendNotification(
                        loadingAtIndex: index,
                        model: notification,
                      ),
                    );
              },
              icon: const Icon(
                Icons.send,
                color: Colors.green,
              ),
            );
          },
        );
      },
    );
  }
}

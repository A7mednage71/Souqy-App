import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_store/core/extensions/navigation_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/admin/notifications/presentation/bloc/add_notification/add_notifications_bloc.dart';
import 'package:my_store/features/auth/widgets/show_toast.dart';

class AddNotificationButton extends StatelessWidget {
  const AddNotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNotificationsBloc, AddNotificationsState>(
      listener: (context, state) {
        state.whenOrNull(
          failure: (message) {
            ShowToast.showFailureToast(
              message,
            );
          },
          success: () {
            ShowToast.showSuccessToast(
              'Notification added successfully',
            );
            context.pop();
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                fixedSize: Size(double.maxFinite, 50.h),
              ),
              onPressed: null,
              child: Center(
                child: SpinKitDualRing(
                  color: Colors.white,
                  size: 20.r,
                ),
              ),
            );
          },
          orElse: () {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                fixedSize: Size(double.maxFinite, 50.h),
              ),
              onPressed: () {
                validateAddNotificationBottomSheet(context);
              },
              child: Text(
                'Add Notification',
                style: context.textStyle.copyWith(
                  color: ColorsDark.blueDark,
                  fontSize: 16.sp,
                ),
              ),
            );
          },
        );
      },
    );
  }

  void validateAddNotificationBottomSheet(BuildContext context) {
    final addNotificationBloc = context.read<AddNotificationsBloc>();
    if (addNotificationBloc.formKey.currentState!.validate()) {
      context.read<AddNotificationsBloc>().add(
            const AddNotificationsEvent.addNotification(),
          );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_linear_button.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/notifications/presentation/bloc/add_notification/add_notifications_bloc.dart';
import 'package:my_store/features/admin/notifications/presentation/bloc/get_notifications/get_notifications_bloc.dart';
import 'package:my_store/features/admin/notifications/presentation/views/widgets/add_notification_bottom_sheet.dart';

class AddNotificationItem extends StatelessWidget {
  const AddNotificationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'All notifications',
          style: context.textStyle.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        const Spacer(),
        CustomLinearButton(
          width: 100.w,
          height: 40.h,
          child: Text(
            'Add',
            style: context.textStyle.copyWith(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          onTap: () async {
            await showAddNotificationBottomSheet(context);
          },
        ),
      ],
    );
  }

  Future<void> showAddNotificationBottomSheet(BuildContext context) async {
    // ignore: inference_failure_on_function_invocation
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: ColorsDark.blueDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      builder: (context) {
        return BlocProvider(
          create: (context) => getIt<AddNotificationsBloc>(),
          child: const AddNotificationBottomSheet(),
        );
      },
    ).whenComplete(() {
      // ignore: use_build_context_synchronously
      context.read<GetNotificationsBloc>().add(
            const GetNotificationsEvent.getNotifications(),
          );
    });
  }
}

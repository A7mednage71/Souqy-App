import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/notifications/presentation/bloc/add_notification/add_notifications_bloc.dart';
import 'package:my_store/features/admin/notifications/presentation/views/widgets/add_notification_button.dart';

class AddNotificationBottomSheet extends StatelessWidget {
  const AddNotificationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final addNotificationBloc = context.read<AddNotificationsBloc>();
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: addNotificationBloc.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              child: Text(
                'Add Notification',
                style: context.textStyle.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Enter the notification title',
              style: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: addNotificationBloc.notificationTitle,
              keyboardType: TextInputType.text,
              hintText: 'Tittle',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid Tittle';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            Text(
              'Enter the notification body',
              style: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: addNotificationBloc.notificationBody,
              keyboardType: TextInputType.text,
              hintText: 'Body',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid Body';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            Text(
              'Enter the product id',
              style: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: addNotificationBloc.productId,
              keyboardType: TextInputType.number,
              hintText: 'product id',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid id';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            const AddNotificationButton(),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/notifications/presentation/widgets/edit_notification_button.dart';

class EditNotificationBottomSheet extends StatelessWidget {
  const EditNotificationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              child: Text(
                'Edit Notification',
                style: context.textStyle.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Edit the notification title',
              style: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: TextEditingController(),
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
              'Edit the notification body',
              style: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: TextEditingController(),
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
              'Edit the product id',
              style: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
              hintText: 'product id',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid id';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            const EditNotificationButton(),
          ],
        ),
      ),
    );
  }
}

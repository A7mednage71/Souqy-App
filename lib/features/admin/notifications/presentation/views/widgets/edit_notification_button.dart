import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/navigation_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/admin/notifications/data/models/add_notification_model.dart';

class EditNotificationButton extends StatelessWidget {
  const EditNotificationButton({
    required this.newNotificationTitle,
    required this.newNotificationBody,
    required this.newNotificationproductId,
    required this.oldNotificationModel,
    required this.formKey,
    super.key,
  });
  final String newNotificationTitle;
  final String newNotificationBody;
  final String newNotificationproductId;
  final AddNotificationModel oldNotificationModel;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        fixedSize: Size(double.maxFinite, 50.h),
      ),
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          oldNotificationModel
            ..title = newNotificationTitle
            ..body = newNotificationBody
            ..productId = int.parse(newNotificationproductId);
          await oldNotificationModel.save();
          if (context.mounted) {
            context.pop();
          }
        }
      },
      child: Text(
        'Edit Notification',
        style: context.textStyle.copyWith(
          color: ColorsDark.blueDark,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}

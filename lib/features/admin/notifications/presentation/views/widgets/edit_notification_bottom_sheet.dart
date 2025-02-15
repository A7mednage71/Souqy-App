import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/notifications/data/models/notification_model.dart';
import 'package:my_store/features/admin/notifications/presentation/views/widgets/edit_notification_button.dart';

class EditNotificationBottomSheet extends StatefulWidget {
  const EditNotificationBottomSheet({required this.notification, super.key});
  final NotificationModel notification;

  @override
  State<EditNotificationBottomSheet> createState() =>
      _EditNotificationBottomSheetState();
}

class _EditNotificationBottomSheetState
    extends State<EditNotificationBottomSheet> {
  late GlobalKey<FormState> formKey;
  late TextEditingController notificationTitle;
  late TextEditingController notificationBody;
  late TextEditingController notificationProductID;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    notificationTitle = TextEditingController(text: widget.notification.title);
    notificationBody = TextEditingController(text: widget.notification.body);
    notificationProductID =
        TextEditingController(text: widget.notification.productId.toString());
    super.initState();
  }

  @override
  void dispose() {
    notificationTitle.dispose();
    notificationBody.dispose();
    notificationProductID.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
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
              controller: notificationTitle,
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
              controller: notificationBody,
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
              controller: notificationProductID,
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
            EditNotificationButton(
              newNotificationTitle: notificationTitle.text.trim(),
              newNotificationBody: notificationBody.text.trim(),
              newNotificationproductId: notificationProductID.text.trim(),
              oldNotificationModel: widget.notification,
              formKey: formKey,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

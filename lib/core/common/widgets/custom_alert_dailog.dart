import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/core/style/images/app_images.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    required this.title,
    required this.message,
    super.key,
    this.onPressed,
  });
  final String title;
  final String message;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.themeColors.mainColor,
      title: Text(
        title,
        style: context.textStyle.copyWith(
          fontSize: 20.sp,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            AppImages.imagesSvgWorningLottie,
            height: 100.h,
          ),
          Text(
            message,
            style: context.textStyle.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.regular,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text(
            'Cancel',
            style: context.textStyle.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeightHelper.bold,
              color: Colors.blue,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'OK',
            style: context.textStyle.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeightHelper.bold,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

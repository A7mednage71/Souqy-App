import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/extensions/navigation_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({required this.title, super.key, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.themeColors.mainColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16.h),
          Text(
            context.translate(title),
            style: context.textStyle.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.bold,
              color: context.themeColors.textColor,
            ),
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              fixedSize: Size(double.maxFinite, 50.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              context.translate(LocalizationKeys.sure),
              style: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              fixedSize: Size(double.maxFinite, 50.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            child: Text(
              context.translate(LocalizationKeys.cancel),
              style: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            onPressed: () {
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}

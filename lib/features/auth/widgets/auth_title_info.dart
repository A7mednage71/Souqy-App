import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';

class AuthTitleInfo extends StatelessWidget {
  const AuthTitleInfo({required this.title, required this.subtitle, super.key});

  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.translate(title),
          style: context.textStyle.copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeightHelper.bold,
            color: context.themeColors.textColor,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          context.translate(subtitle),
          style: context.textStyle.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeightHelper.medium,
            color: context.themeColors.textColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

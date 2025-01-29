import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/core/style/images/app_images.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.imagesCoreEmptyScreen,
            height: 200.h,
            width: 200.w,
          ),
          Text(
            'No data',
            style: context.textStyle.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeightHelper.medium,
              color: context.themeColors.textColor,
            ),
          ),
        ],
      ),
    );
  }
}

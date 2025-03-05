import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';

class ViewAllProductsButton extends StatelessWidget {
  const ViewAllProductsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: context.themeColors.bluePinkLight,
        fixedSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      onPressed: () {},
      child: Text(
        'View All Products',
        style: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeightHelper.medium,
        ),
      ),
    );
  }
}

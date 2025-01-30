import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';

class UpdateProductButton extends StatelessWidget {
  const UpdateProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        fixedSize: Size(double.maxFinite, 50.h),
      ),
      onPressed: () {},
      child: Text(
        'Update Product',
        style: context.textStyle.copyWith(
          color: ColorsDark.blueDark,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}

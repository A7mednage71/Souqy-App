import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_linear_button.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomLinearButton(
      width: 100.w,
      height: 40.h,
      child: Text(
        'Add',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      onTap: () {},
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_linear_button.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Get All Categories',
          style: context.textStyle.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        const Spacer(),
        CustomLinearButton(
          width: 100.w,
          height: 40.h,
          child: Text(
            'Add',
            style: context.textStyle.copyWith(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}

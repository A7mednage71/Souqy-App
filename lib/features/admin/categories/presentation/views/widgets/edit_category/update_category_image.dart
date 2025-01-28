import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';

class UpdateCategoryImage extends StatelessWidget {
  const UpdateCategoryImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Update category photo',
          style: context.textStyle.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        SizedBox(height: 10.h),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(10.r),
          child: Container(
            height: 150.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.grey.withOpacity(0.4),
            ),
            child: Center(
              child: Icon(
                Icons.add_a_photo_outlined,
                size: 50.h,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

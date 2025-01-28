import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/create_category/create_category_button.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/create_category/pick_remove_category_image.dart';

class CreateCategryBottomSheet extends StatelessWidget {
  const CreateCategryBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            child: Text(
              'Create Category',
              style: context.textStyle.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          const PickAndRemoveCategoryImage(),
          SizedBox(height: 10.h),
          Text(
            'Enter Category Name',
            style: context.textStyle.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.regular,
            ),
          ),
          SizedBox(height: 10.h),
          CustomTextField(
            controller: TextEditingController(),
            keyboardType: TextInputType.text,
            hintText: 'Category Name',
          ),
          SizedBox(height: 20.h),
          const CreateCategeryButton(),
        ],
      ),
    );
  }
}

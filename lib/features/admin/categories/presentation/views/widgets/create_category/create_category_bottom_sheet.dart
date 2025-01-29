import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/helpers/my_validator.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/create_category/create_category_bloc.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/create_category/create_category_button.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/create_category/pick_category_image.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/create_category/remove_category_image.dart';

class CreateCategryBottomSheet extends StatelessWidget {
  const CreateCategryBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        key: context.read<CreateCategoryBloc>().formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            const RemoveCategoryImage(),
            SizedBox(height: 10.h),
            const PickCategoryImage(),
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
              controller:
                  context.read<CreateCategoryBloc>().categoryNameController,
              keyboardType: TextInputType.text,
              hintText: 'Category Name',
              validator: (value) {
                if (!MyValidator.isNamevalidator(value!)) {
                  return 'Please enter a valid name';
                }
                return null;
              },
            ),
            SizedBox(height: 10.h),
            const CreateCategeryButton(),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}

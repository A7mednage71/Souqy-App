import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/helpers/my_validator.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/categories/data/models/categories_response_model.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/update_category/update_category_bloc.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/edit_category/update_category_button.dart';
import 'package:my_store/features/admin/categories/presentation/views/widgets/edit_category/update_category_image.dart';

class EditCategoryBottomSheet extends StatefulWidget {
  const EditCategoryBottomSheet({required this.category, super.key});
  final Category category;

  @override
  State<EditCategoryBottomSheet> createState() =>
      _EditCategoryBottomSheetState();
}

class _EditCategoryBottomSheetState extends State<EditCategoryBottomSheet> {
  @override
  void initState() {
    context.read<UpdateCategoryBloc>().updateCategoryNameController.text =
        widget.category.name;
    super.initState();
  }

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
        key: context.read<UpdateCategoryBloc>().formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              child: Text(
                'Update Category',
                style: context.textStyle.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            UpdateCategoryImage(category: widget.category),
            SizedBox(height: 10.h),
            Text(
              'Update Category Name',
              style: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.regular,
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: context
                  .read<UpdateCategoryBloc>()
                  .updateCategoryNameController,
              keyboardType: TextInputType.text,
              hintText: 'Category Name',
              validator: (value) {
                if (!MyValidator.isCategoryNameValid(value!)) {
                  return 'Please enter a valid name';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            UpdateCategoryButton(category: widget.category),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

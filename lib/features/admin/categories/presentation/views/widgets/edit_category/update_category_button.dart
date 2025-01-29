import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_store/core/extensions/navigation_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/admin/categories/data/models/categories_response_model.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/update_category/update_category_bloc.dart';
import 'package:my_store/features/auth/widgets/show_toast.dart';

class UpdateCategoryButton extends StatelessWidget {
  const UpdateCategoryButton({required this.category, super.key});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateCategoryBloc, UpdateCategoryState>(
      listener: (context, state) {
        state.whenOrNull(
          failure: (message) {
            ShowToast.showFailureToast(
              message,
            );
          },
          success: () {
            ShowToast.showSuccessToast(
              'Category updated successfully',
            );
            context.pop();
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                fixedSize: Size(double.maxFinite, 50.h),
              ),
              onPressed: null,
              child: const Center(
                child: Center(
                  child: SpinKitDualRing(
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            );
          },
          orElse: () {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                fixedSize: Size(double.maxFinite, 50.h),
              ),
              onPressed: () {
                validateUpdateForm(context);
              },
              child: Text(
                'Update the category',
                style: context.textStyle.copyWith(
                  color: ColorsDark.blueDark,
                  fontSize: 16.sp,
                ),
              ),
            );
          },
        );
      },
    );
  }

  void validateUpdateForm(BuildContext context) {
    final updateCubit = context.read<UpdateCategoryBloc>();
    if (updateCubit.formKey.currentState!.validate()) {
      final name = updateCubit.updateCategoryNameController.text.trim();
      final image = updateCubit.updatedImage;

      if (image == '' && name == category.name) {
        log('Nothing to update');
        ShowToast.showFailureToast(
          'Nothing to update',
        );
        return;
      }
      log('Updated image and name');
      updateCubit.add(
        UpdateCategoryEvent.updateCategory(
          category: Category(id: category.id, name: name, image: image),
        ),
      );
    }
  }
}

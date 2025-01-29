import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_store/core/extensions/navigation_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/create_category/create_category_bloc.dart';
import 'package:my_store/features/auth/widgets/show_toast.dart';

class CreateCategeryButton extends StatelessWidget {
  const CreateCategeryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateCategoryBloc, CreateCategoryState>(
      listener: (context, state) {
        state.whenOrNull(
          failure: (message) {
            ShowToast.showFailureToast(
              message,
            );
          },
          success: (response) {
            ShowToast.showSuccessToast(
              'Category created successfully',
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
                child: SpinKitDualRing(
                  color: Colors.white,
                  size: 20,
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
                validateCreateCategory(context);
              },
              child: Text(
                'Create a new category',
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

  void validateCreateCategory(BuildContext context) {
    final image = context.read<CreateCategoryBloc>().categoryImage;
    final category =
        context.read<CreateCategoryBloc>().categoryNameController.text.trim();
    if (context.read<CreateCategoryBloc>().formKey.currentState!.validate() &&
        category.isNotEmpty) {
      if (image.isEmpty || image == '') {
        ShowToast.showFailureToast(
          'Please pick Category image',
        );
        return;
      }
      context
          .read<CreateCategoryBloc>()
          .add(const CreateCategoryEvent.createCategory());
    }
  }
}

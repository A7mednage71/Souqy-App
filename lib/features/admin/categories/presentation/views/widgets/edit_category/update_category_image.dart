import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/extensions/string_extension.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/categories/data/models/categories_response_model.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/update_category/update_category_bloc.dart';
import 'package:my_store/features/auth/widgets/show_toast.dart';

class UpdateCategoryImage extends StatelessWidget {
  const UpdateCategoryImage({required this.category, super.key});
  final Category category;
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
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10.h),
        BlocConsumer<UploadImageCubit, UploadImageState>(
          listener: (context, state) {
            state.whenOrNull(
              failure: ShowToast.showFailureToast,
              success: () {
                ShowToast.showSuccessToast(
                  context.translate(LocalizationKeys.imageUploaded),
                );
              },
            );
          },
          builder: (context, state) {
            final cubit = context.read<UploadImageCubit>();
            final image = cubit.uploadImageUrl;

            return state.maybeWhen(
              loading: () {
                return Container(
                  height: 150.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.grey.withOpacity(0.4),
                  ),
                  child: const Center(
                    child: SpinKitCircle(
                      color: Colors.white,
                    ),
                  ),
                );
              },
              orElse: () {
                if (image.isNotEmpty) {
                  log('image$image');
                  context.read<UpdateCategoryBloc>().updatedImage = image;
                }
                return InkWell(
                  onTap: cubit.uploadImage,
                  borderRadius: BorderRadius.circular(10.r),
                  child: Container(
                    height: 150.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.grey.withOpacity(0.4),
                      image: DecorationImage(
                        image: NetworkImage(
                          image.isNotEmpty
                              ? image
                              : category.image.fixImageFormate(),
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        size: 50.h,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

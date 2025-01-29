import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/features/admin/categories/presentation/bloc/create_category/create_category_bloc.dart';
import 'package:my_store/features/auth/widgets/show_toast.dart';

class PickCategoryImage extends StatelessWidget {
  const PickCategoryImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
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
                child: SpinKitSquareCircle(
                  color: Colors.white,
                ),
              ),
            );
          },
          orElse: () {
            if (image.isNotEmpty) {
              context.read<CreateCategoryBloc>().categoryImage = image;
            }
            return InkWell(
              onTap: image.isEmpty ? cubit.uploadImage : null,
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                height: 150.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.grey.withOpacity(0.4),
                  image: image.isEmpty
                      ? null
                      : DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        ),
                ),
                child: image.isNotEmpty
                    ? null
                    : Center(
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
    );
  }
}

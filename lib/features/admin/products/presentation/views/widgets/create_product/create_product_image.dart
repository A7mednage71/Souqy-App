import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/features/admin/products/presentation/bloc/create_product/create_product_bloc.dart';
import 'package:my_store/features/auth/widgets/show_toast.dart';

class CreateProductImage extends StatelessWidget {
  const CreateProductImage({
    required this.imageIndex,
    super.key,
  });
  final int imageIndex;
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
        final uploadImageCubit = context.read<UploadImageCubit>();
        final createProductBloc = context.read<CreateProductBloc>();

        return state.maybeWhen(
          loadingImageAtIndex: (index) {
            if (index == imageIndex) {
              return Container(
                height: 90.h,
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
            } else {
              return Container(
                height: 90.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.grey.withOpacity(0.4),
                  image: uploadImageCubit.imagesUrls[imageIndex].isEmpty
                      ? null
                      : DecorationImage(
                          image: NetworkImage(
                            uploadImageCubit.imagesUrls[imageIndex],
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
              );
            }
          },
          orElse: () {
            if (uploadImageCubit.imagesUrls[imageIndex].isNotEmpty) {
              createProductBloc.images[imageIndex] =
                  uploadImageCubit.imagesUrls[imageIndex];
            }
            return InkWell(
              onTap: () {
                uploadImageCubit.uploadMultipleImage(imageIndex);
              },
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                height: 90.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.grey.withOpacity(0.4),
                  image: uploadImageCubit.imagesUrls[imageIndex].isEmpty
                      ? null
                      : DecorationImage(
                          image: NetworkImage(
                            uploadImageCubit.imagesUrls[imageIndex],
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
    );
  }
}

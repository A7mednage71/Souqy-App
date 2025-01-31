import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/admin/products/presentation/bloc/update_product/update_product_bloc.dart';
import 'package:my_store/features/auth/widgets/show_toast.dart';

class UpdateProductImage extends StatelessWidget {
  const UpdateProductImage({
    required this.imageIndex,
    super.key,
    this.product,
  });
  final int imageIndex;
  final ProductModel? product;
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
        final updateProductBloc = context.read<UpdateProductBloc>();

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
                      ? DecorationImage(
                          image: NetworkImage(
                            product!.images![imageIndex],
                          ),
                          fit: BoxFit.fill,
                        )
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
              updateProductBloc.updatedImages[imageIndex] =
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
                      ? DecorationImage(
                          image: NetworkImage(
                            product!.images![imageIndex],
                          ),
                          fit: BoxFit.fill,
                        )
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

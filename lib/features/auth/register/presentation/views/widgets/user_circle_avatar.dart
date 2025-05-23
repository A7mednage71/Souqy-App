import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:my_store/core/constants/app_constants.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/features/auth/widgets/show_toast.dart';

class UserCircleAvatar extends StatelessWidget {
  const UserCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 500,
      child: BlocConsumer<UploadImageCubit, UploadImageState>(
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
              return Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade400,
                    radius: 40.r,
                    backgroundImage: image.isNotEmpty
                        ? NetworkImage(image)
                        : const NetworkImage(AppConstants.userAvatar),
                  ),
                  SizedBox(
                    width: 80.r,
                    height: 80.r,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                        context.themeColors.bluePinkLight,
                      ),
                      strokeWidth: 4.r,
                      backgroundColor: Colors.grey.shade400,
                    ),
                  ),
                ],
              );
            },
            orElse: () {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade400,
                    radius: 40.r,
                    backgroundImage: image != ''
                        ? NetworkImage(image)
                        : const NetworkImage(AppConstants.userAvatar),
                  ),
                  Positioned(
                    top: -15,
                    right: -15,
                    child: IconButton(
                      onPressed: () async {
                        log('onPressed');
                        image != ''
                            ? cubit.deleteImage()
                            : await cubit.uploadImage();
                      },
                      icon: Icon(
                        image != '' ? Icons.remove_circle : Icons.camera_alt,
                        color: context.themeColors.bluePinkLight,
                        size: 25.r,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

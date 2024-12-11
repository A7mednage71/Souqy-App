import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/constants/app_constants.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/helpers/image_picker.dart';

class UserCircleAvatar extends StatelessWidget {
  const UserCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 500,
      child: InkWell(
        borderRadius: BorderRadius.circular(50.r),
        onTap: ImagePickerHelper.pickImage,
        child: CircleAvatar(
          backgroundColor: context.themeColors.bluePinkLight,
          radius: 40.r,
          child: Image.network(
            AppConstants.userAvatar,
          ),
        ),
      ),
    );
  }
}

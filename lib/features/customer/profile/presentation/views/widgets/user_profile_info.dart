import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/customer/profile/data/models/user_profile_model.dart';
import 'package:my_store/features/customer/profile/presentation/views/widgets/show_user_image.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({
    required this.user,
    super.key,
  });
  final UserProfileModel? user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        ShowUserImage(
          image: user?.userAvatar,
        ),
        SizedBox(height: 15.h),
        Text(
          user?.userName ?? 'Souqy_person',
          style: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          user?.userEmail ?? 'ZbWfQ@example.com',
          style: context.textStyle.copyWith(fontSize: 14.sp),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/customer/profile/presentation/bloc/get_user_profile/get_user_profile_bloc.dart';
import 'package:my_store/features/customer/profile/presentation/views/widgets/app_language.dart';
import 'package:my_store/features/customer/profile/presentation/views/widgets/user_profile_info_bloc_builder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetUserProfileBloc>(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserProfileInfoBlocBuilder(),
            SizedBox(height: 20.h),
            CustomFadeInRight(
              duration: 400,
              child: Text(
                context.translate(LocalizationKeys.applicationFeatures),
                style: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            const AppLanguage(),
          ],
        ),
      ),
    );
  }
}

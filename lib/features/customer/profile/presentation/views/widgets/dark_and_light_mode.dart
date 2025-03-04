import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_store/core/app/app_cubit/cubit/app_cubit.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/core/style/images/app_images.dart';

class DarkAndLightMode extends StatelessWidget {
  const DarkAndLightMode({super.key});

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>();
    return Row(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              AppImages.imagesSvgDarkMode,
              color: context.themeColors.textColor,
            ),
            SizedBox(width: 10.w),
            Text(
              context.translate(LocalizationKeys.darkMode),
              style: context.textStyle.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ],
        ),
        const Spacer(),
        Transform.scale(
          scale: 0.8,
          child: Switch.adaptive(
            inactiveTrackColor: Colors.grey,
            inactiveThumbColor: Colors.white,
            activeTrackColor: Colors.green,
            activeColor: Colors.white,
            value: appCubit.isDarkTheme,
            onChanged: (value) => appCubit.toggleTheme(),
          ),
        ),
      ],
    );
  }
}

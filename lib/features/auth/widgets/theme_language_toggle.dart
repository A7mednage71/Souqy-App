import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/app/app_cubit/cubit/app_cubit.dart';
import 'package:my_store/core/common/widgets/custom_linear_button.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';

class AppThemeAndLanguageToggle extends StatelessWidget {
  const AppThemeAndLanguageToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            final isDarkTheme = context.read<AppCubit>().isDarkTheme;
            return CustomFadeInRight(
              duration: 400,
              child: CustomLinearButton(
                child: Icon(
                  isDarkTheme
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded,
                  color: Colors.white,
                ),
                onTap: () {
                  context.read<AppCubit>().toggleTheme();
                },
              ),
            );
          },
        ),
        CustomFadeInLeft(
          duration: 400,
          child: CustomLinearButton(
            width: 100.w,
            child: Text(
              context.translate(LocalizationKeys.language),
              style: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.bold,
                color: Colors.white,
              ),
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/app_cubit/cubit/app_cubit.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/extensions/navigation_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/languages/app_localizations.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';

class ChangeLanguageDailog extends StatelessWidget {
  const ChangeLanguageDailog({super.key});

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>();
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.h),
              Text(
                context.translate(LocalizationKeys.changeToTheLanguage),
                style: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.bold,
                  color: context.themeColors.mainColor,
                ),
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  fixedSize: Size(double.maxFinite, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: Text(
                  context.translate(LocalizationKeys.sure),
                  style: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
                onPressed: () {
                  if (AppLocalizations.of(context)!.isEnLocale) {
                    appCubit.changeLanguageToArabic();
                  } else {
                    appCubit.changeLanguageToEnglish();
                  }
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  fixedSize: Size(double.maxFinite, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: Text(
                  context.translate(LocalizationKeys.cancel),
                  style: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/core/style/images/app_images.dart';
import 'package:my_store/features/customer/profile/presentation/views/widgets/change_language_dailog.dart';

class AppLanguage extends StatelessWidget {
  const AppLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              AppImages.imagesSvgLanguage,
              color: context.themeColors.textColor,
            ),
            SizedBox(width: 10.w),
            Text(
              context.translate(LocalizationKeys.languageTilte),
              style: context.textStyle.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            showDialog<void>(
              context: context,
              builder: (context) => const ChangeLanguageDailog(),
            );
          },
          child: Row(
            children: [
              Text(
                context.translate(LocalizationKeys.langCode),
                style: context.textStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
              SizedBox(width: 5.w),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: context.themeColors.textColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

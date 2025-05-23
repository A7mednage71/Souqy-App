import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/app/app_version_info.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/core/style/images/app_images.dart';

class BuildVersion extends StatelessWidget {
  const BuildVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 400,
      child: Row(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppImages.imagesSvgBuildVersion,
                // ignore: deprecated_member_use
                color: context.themeColors.textColor,
              ),
              SizedBox(width: 10.w),
              Text(
                context.translate(LocalizationKeys.buildVersion),
                style: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
            ],
          ),
          const Spacer(),
          FutureBuilder<String>(
            future: AppVersionInfo.getAppVersion(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data.toString(),
                  style: context.textStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeightHelper.regular,
                    color: context.themeColors.textColor,
                  ),
                );
              } else {
                return const CircularProgressIndicator.adaptive();
              }
            },
          ),
        ],
      ),
    );
  }
}

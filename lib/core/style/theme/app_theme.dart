import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/core/style/colors/colors_light.dart';
import 'package:my_store/core/style/fonts/font_family_helper.dart';
import 'package:my_store/core/style/theme/theme_assets_extension.dart';
import 'package:my_store/core/style/theme/theme_colors_extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ColorsLight.mainColor,
      extensions: <ThemeExtension<dynamic>>[
        MyColors.light,
        MyAssets.light,
        // ignore: deprecated_member_use
        SkeletonizerConfigData.light(
          effect: ShimmerEffect(
            highlightColor: Colors.white,
            baseColor: Colors.grey[300]!,
          ),
        ),
      ],
      useMaterial3: true,
      textTheme: TextTheme(
        displaySmall: TextStyle(
          color: ColorsLight.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamilyHelper.getFontFamily(),
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ColorsDark.mainColor,
      extensions: <ThemeExtension<dynamic>>[
        MyColors.dark,
        MyAssets.dark,
        SkeletonizerConfigData.dark(
          effect: ShimmerEffect(
            highlightColor: Colors.white.withOpacity(0.7),
            baseColor: Colors.white24,
          ),
        ),
      ],
      useMaterial3: true,
      textTheme: TextTheme(
        displaySmall: TextStyle(
          color: ColorsDark.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamilyHelper.getFontFamily(),
        ),
      ),
    );
  }
}

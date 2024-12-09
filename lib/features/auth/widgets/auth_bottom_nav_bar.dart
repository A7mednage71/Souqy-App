import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/features/auth/widgets/auth_bottom_nav_bar_custom_painter.dart';

class AuthBottomNavBar extends StatelessWidget {
  const AuthBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, 140.h),
      painter: AuthNavBarCustomPainter(
        gradient: LinearGradient(
          colors: [
            context.themeColors.bluePinkLight!,
            context.themeColors.bluePinkLight!,
            context.themeColors.bluePinkLight!,
            context.themeColors.bluePinkLight!,
          ],
        ),
      ),
    );
  }
}

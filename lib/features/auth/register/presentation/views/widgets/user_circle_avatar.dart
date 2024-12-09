import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/extensions/theme_context.dart';

class UserCircleAvatar extends StatelessWidget {
  const UserCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 500,
      child: CircleAvatar(
        backgroundColor: context.themeColors.bluePinkLight,
        radius: 40.r,
        child: Icon(
          Icons.person,
          color: context.themeColors.textColor,
          size: 40.r,
        ),
      ),
    );
  }
}

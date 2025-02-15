import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_store/core/extensions/theme_context.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    required this.icon,
    required this.isSelected,
    super.key,
    this.onTap,
  });
  final void Function()? onTap;

  final String icon;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        icon,
        width: 25.w,
        height: 25.h,
        color: isSelected ? context.themeColors.navBarSelectedTab : Colors.grey,
      ),
    );
  }
}

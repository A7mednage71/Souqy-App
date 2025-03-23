import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/enums/bottom_nav_bar_items.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/core/style/images/app_images.dart';
import 'package:my_store/features/customer/customer_main/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:my_store/features/customer/customer_main/presentation/views/widgets/bottom_nav_bar_item.dart';

class NotificationsNavBarItem extends StatelessWidget {
  const NotificationsNavBarItem({
    required this.navCubit,
    super.key,
  });

  final BottomNavigationCubit navCubit;

  @override
  Widget build(BuildContext context) {
    return badge.Badge(
      badgeContent: Text(
        '3',
        style: context.textStyle.copyWith(
          color: Colors.white,
          fontWeight: FontWeightHelper.bold,
          fontSize: 11.sp,
        ),
        textAlign: TextAlign.center,
      ),
      badgeAnimation: const badge.BadgeAnimation.scale(),
      position: badge.BadgePosition.topEnd(end: -6.w, top: -10.h),
      badgeStyle: badge.BadgeStyle(
        badgeColor: Colors.pink,
        padding: EdgeInsets.all(5.h),
        elevation: 0,
      ),
      child: BottomNavBarItem(
        icon: AppImages.imagesSvgIconsNotification,
        isSelected:
            navCubit.selectedBottomNavBar == BottomNavBarItems.notifications,
        onTap: navCubit.navigateToNotifications,
      ),
    );
  }
}

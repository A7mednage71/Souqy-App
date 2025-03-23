import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/enums/bottom_nav_bar_items.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/core/style/images/app_images.dart';
import 'package:my_store/features/customer/customer_main/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:my_store/features/customer/customer_main/presentation/views/widgets/bottom_nav_bar_item.dart';
import 'package:my_store/features/customer/notifications/data/models/customer_notification_model.dart';
import 'package:my_store/features/customer/notifications/data/repos/customer_notifications_repo.dart';

class NotificationsNavBarItem extends StatelessWidget {
  const NotificationsNavBarItem({
    required this.navCubit,
    super.key,
  });

  final BottomNavigationCubit navCubit;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CustomerNotificationModel>>(
      stream: CustomerNotificationsRepo.getNotificationsStream(),
      builder: (context, snapshot) {
        final count = snapshot.data?.length ?? 0;

        return badge.Badge(
          showBadge: count > 0,
          badgeContent: Text(
            count.toString(),
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
            isSelected: navCubit.selectedBottomNavBar ==
                BottomNavBarItems.notifications,
            onTap: navCubit.navigateToNotifications,
          ),
        );
      },
    );
  }
}

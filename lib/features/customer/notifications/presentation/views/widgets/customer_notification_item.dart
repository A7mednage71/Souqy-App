import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/core/style/images/app_images.dart';
import 'package:my_store/features/customer/notifications/data/models/customer_notification_model.dart';

class CustomerNotificationItem extends StatelessWidget {
  const CustomerNotificationItem({required this.notificationModel, super.key});
  final CustomerNotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 30.r,
        child: CircleAvatar(
          backgroundColor: context.themeColors.mainColor,
          radius: 25.r,
          child: SvgPicture.asset(
            AppImages.imagesSvgIconsNotification,
            height: 30.h,
            width: 30.w,
            colorFilter: const ColorFilter.mode(Colors.pink, BlendMode.srcIn),
          ),
        ),
      ),
      title: Text(
        notificationModel.title,
        style: context.textStyle.copyWith(fontWeight: FontWeightHelper.bold),
      ),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          5.h.verticalSpace,
          Text(
            notificationModel.body,
            style: context.textStyle,
          ),
          5.h.verticalSpace,
          Text(
            notificationModel.createdAt,
            style: context.textStyle,
          ),
          5.h.verticalSpace,
          Divider(
            color: context.themeColors.textColor,
          ),
        ],
      ),
      trailing: InkWell(
        onTap: () {},
        child: Icon(
          Icons.clear,
          color: context.themeColors.textColor,
          size: 20.sp,
        ),
      ),
    );
  }
}

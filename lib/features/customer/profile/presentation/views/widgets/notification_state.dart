import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/core/services/cloud_messaging/firebase_messaging_helper.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';

class NotificationsState extends StatelessWidget {
  const NotificationsState({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 400,
      child: Row(
        children: [
          Row(
            children: [
              Icon(
                Icons.notifications,
                size: 25.r,
                color: context.themeColors.textColor,
              ),
              SizedBox(width: 10.w),
              Text(
                context.translate(LocalizationKeys.notifications),
                style: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
            ],
          ),
          const Spacer(),
          ValueListenableBuilder(
            valueListenable: FirebaseMessagingHelper.instance.isTopicSubscribed,
            builder: (context, value, child) {
              return Transform.scale(
                scale: 0.8,
                child: Switch.adaptive(
                  inactiveTrackColor: Colors.grey,
                  inactiveThumbColor: Colors.white,
                  activeTrackColor: Colors.green,
                  activeColor: Colors.white,
                  value: value,
                  onChanged: (value) async {
                    await FirebaseMessagingHelper.instance
                        .controlUserSubscription(context);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

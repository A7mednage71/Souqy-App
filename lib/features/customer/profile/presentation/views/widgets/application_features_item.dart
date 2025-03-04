import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';

class ApplicationFeaturesItem extends StatelessWidget {
  const ApplicationFeaturesItem({
    required this.image,
    required this.leadingText,
    required this.trailingText,
    this.onTap,
    super.key,
  });
  final String image;
  final String leadingText;
  final String trailingText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              image,
              // ignore: deprecated_member_use
              color: context.themeColors.textColor,
            ),
            SizedBox(width: 10.w),
            Text(
              context.translate(leadingText),
              style: context.textStyle.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeightHelper.regular,
              ),
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Text(
                context.translate(trailingText),
                style: context.textStyle.copyWith(
                  fontSize: 14.sp,
                  color: context.themeColors.textColor,
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

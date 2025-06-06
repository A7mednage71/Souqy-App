import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_container_with_gradient.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DashboardItem extends StatelessWidget {
  const DashboardItem({
    required this.title,
    required this.count,
    required this.image,
    super.key,
    this.isloading = false,
  });
  final String title;
  final String count;
  final String image;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return CustomContainerWithGradient(
      height: 130.h,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textStyle.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: context.themeColors.textColor,
                  ),
                ),
                const Spacer(),
                if (!isloading)
                  Text(
                    count,
                    style: context.textStyle.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: context.themeColors.textColor,
                    ),
                  ),
                if (isloading)
                  Skeletonizer(
                    child: Text(
                      'Loading',
                      style: context.textStyle.copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: context.themeColors.textColor,
                      ),
                    ),
                  ),
              ],
            ),
            const Spacer(),
            Image.asset(
              image,
              width: 100.w,
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }
}

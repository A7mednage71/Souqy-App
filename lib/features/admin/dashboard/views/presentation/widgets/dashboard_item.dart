import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:shimmer/shimmer.dart';

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
    return Container(
      width: double.infinity,
      height: 130.h,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        gradient: LinearGradient(
          colors: [
            ColorsDark.black1.withOpacity(0.8),
            ColorsDark.black2.withOpacity(0.8),
          ],
          begin: const Alignment(0.36, 0.27),
          end: const Alignment(0.58, 0.85),
        ),
        shadows: const [
          BoxShadow(
            blurRadius: 2,
            offset: Offset(0, 4),
            color: ColorsDark.black1,
          ),
          BoxShadow(
            blurRadius: 4,
            offset: Offset(0, -1),
            color: ColorsDark.black1,
          ),
        ],
      ),
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
                  Shimmer.fromColors(
                    baseColor: Colors.grey[700]!,
                    highlightColor: Colors.grey[500]!,
                    child: Container(
                      width: 50.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
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

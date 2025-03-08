import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';

class CustomContainerWithGradient extends StatelessWidget {
  const CustomContainerWithGradient({
    required this.child,
    this.height,
    super.key,
    this.width,
  });
  final double? height;
  final double? width;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 120.h,
      width: width ?? MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        gradient: LinearGradient(
          colors: [
            // ignore: deprecated_member_use
            context.themeColors.containerLinear1!.withOpacity(0.8),
            // ignore: deprecated_member_use
            context.themeColors.containerLinear2!.withOpacity(0.8),
          ],
          begin: const Alignment(0.36, 0.27),
          end: const Alignment(0.58, 0.85),
        ),
        shadows: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: context.themeColors.containerShadow1!.withOpacity(0.3),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
          BoxShadow(
            // ignore: deprecated_member_use
            color: context.themeColors.containerShadow1!.withOpacity(0.3),
            offset: const Offset(0, 4),
            blurRadius: 2,
          ),
        ],
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';

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
      child: child,
    );
  }
}

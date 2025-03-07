import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';

class CustomLinearButton extends StatelessWidget {
  const CustomLinearButton({
    required this.child,
    super.key,
    this.width,
    this.height,
    this.onTap,
  });

  final Widget child;
  final double? width;
  final double? height;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: width ?? 44.w,
        height: height ?? 44.h,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          gradient: LinearGradient(
            colors: [
              context.themeColors.bluePinkLight!,
              context.themeColors.bluePinkDark!,
            ],
            begin: const Alignment(0.46, -0.89),
            end: const Alignment(-0.46, 0.89),
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}

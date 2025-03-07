import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:my_store/core/style/images/app_images.dart';

class SearchLottie extends StatelessWidget {
  const SearchLottie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Lottie.asset(
        AppImages.imagesSvgSearchLottie,
        height: 250.h,
        width: 200.w,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:my_store/core/style/images/app_images.dart';

class FailureState extends StatelessWidget {
  const FailureState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppImages.imagesCoreFailureState,
            height: 150.h,
            width: 150.w,
            fit: BoxFit.contain,
          ),
          Text(
            'Something went wrong \nPlease try again later...!',
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

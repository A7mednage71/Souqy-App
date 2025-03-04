import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:my_store/core/style/images/app_images.dart';

class FailureState extends StatelessWidget {
  const FailureState({this.message, super.key, this.failureHeight});

  final double? failureHeight;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppImages.imagesCoreFailureState,
            height: failureHeight ?? 150.h,
            width: failureHeight ?? 150.w,
            fit: BoxFit.contain,
          ),
          Text(
            message ?? 'Something went wrong \nPlease try again later...!',
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

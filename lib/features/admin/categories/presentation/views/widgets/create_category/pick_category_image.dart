import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PickCategoryImage extends StatelessWidget {
  const PickCategoryImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        height: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.grey.withOpacity(0.4),
        ),
        child: Center(
          child: Icon(
            Icons.add_a_photo_outlined,
            size: 50.h,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

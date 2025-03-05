import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/show_cached_image.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';

class CustomerCategoryItem extends StatelessWidget {
  const CustomerCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 110.h,
      child: Column(
        children: [
          ShowCachedNetworkImage(
            image: 'https://picsum.photos/200/300',
            height: 70.h,
            width: 70.w,
          ),
          SizedBox(height: 5.h),
          Text(
            'Category name',
            style: context.textStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeightHelper.medium,
              color: context.themeColors.textColor,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

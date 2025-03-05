import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/show_cached_image.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/categories/data/models/categories_response_model.dart';

class CustomerCategoryItem extends StatelessWidget {
  const CustomerCategoryItem({required this.category, super.key});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 110.h,
      child: Column(
        children: [
          ShowCachedNetworkImage(
            image: category.image,
            height: 70.h,
            width: 70.w,
          ),
          SizedBox(height: 5.h),
          Text(
            category.name,
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

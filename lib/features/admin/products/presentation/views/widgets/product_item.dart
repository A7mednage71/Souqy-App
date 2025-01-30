import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_container_with_gradient.dart';
import 'package:my_store/core/common/widgets/show_cached_image.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/delet_product.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/update_product/edit_product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithGradient(
      height: 220.h,
      width: 150.w,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EditProduct(),
                DeleteProduct(),
              ],
            ),
            const Align(
              child: ShowCachedNetworkImage(
                image: 'https://i.imgur.com/QkIa5tT.jpeg',
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              'Classic Grey Hooded',
              style: context.textStyle.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeightHelper.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5.h),
            Text(
              'Price',
              style: context.textStyle.copyWith(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              r'$ 10.00',
              style: context.textStyle.copyWith(
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

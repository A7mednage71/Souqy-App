import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_customer_container_with_gradient.dart';
import 'package:my_store/core/common/widgets/show_cached_image.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';

class CustomerProductItem extends StatelessWidget {
  const CustomerProductItem({
    required this.productModel,
    super.key,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return CustomCustomerContainerWithgradient(
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                Icon(
                  Icons.favorite_outline,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Align(
              child: ShowCachedNetworkImage(
                image: productModel.images!.first,
                height: 130,
                width: 150,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              productModel.title ?? '',
              style: context.textStyle.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeightHelper.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5.h),
            Text(
              productModel.category?.name ?? '',
              style: context.textStyle.copyWith(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5.h),
            Text(
              r'$' '${productModel.price}',
              style: context.textStyle.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

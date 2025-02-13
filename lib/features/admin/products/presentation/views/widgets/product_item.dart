import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_container_with_gradient.dart';
import 'package:my_store/core/common/widgets/show_cached_image.dart';
import 'package:my_store/core/extensions/string_extension.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/delet_product.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/update_product/edit_product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({required this.product, super.key});
  final ProductModel? product;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EditProduct(product: product),
                DeleteProduct(productId: product?.id ?? ''),
              ],
            ),
            Align(
              child: ShowCachedNetworkImage(
                image: product?.images?.first.fixImageFormate() ?? '',
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              product?.title ?? '',
              style: context.textStyle.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeightHelper.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5.h),
            Text(
              product?.category?.name ?? '',
              style: context.textStyle.copyWith(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5.h),
            Text(
              r'$' '${product?.price}',
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

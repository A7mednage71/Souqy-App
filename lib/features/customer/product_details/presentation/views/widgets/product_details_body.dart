import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_banners_slider.dart';
import 'package:my_store/core/common/widgets/custom_favorite_button.dart';
import 'package:my_store/core/common/widgets/custom_share_button.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/customer/product_details/presentation/views/widgets/product_add_to_cart.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({required this.product, super.key});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomShareButton(size: 30.r),
              CustomFavoriteButton(
                size: 30.r,
                product: product,
              ),
            ],
          ),
          20.h.verticalSpace,
          CustomBannersSlider(images: product.images),
          20.h.verticalSpace,
          Text(
            '${product.title}',
            style: context.textStyle.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          10.h.verticalSpace,
          Text(
            '${product.category!.name}',
            style: context.textStyle.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.bold,
              color: context.themeColors.bluePinkLight,
            ),
          ),
          30.h.verticalSpace,
          Text(
            '${product.description}',
            style: context.textStyle.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.medium,
            ),
          ),
          const Spacer(),
          ProductAddToCart(price: product.price.toString()),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_linear_button.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';

class ProductDetailsBottomSheet extends StatelessWidget {
  const ProductDetailsBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90.h,
      decoration: BoxDecoration(
        color: context.themeColors.containerShadow1,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            r'$ 100.0',
            style: context.textStyle.copyWith(
              fontSize: 20.sp,
              color: context.themeColors.bluePinkLight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: CustomLinearButton(
              width: 0.4.sw,
              child: Text(
                'Add to cart',
                style: context.textStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.bold,
                  color: context.themeColors.textColor,
                ),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

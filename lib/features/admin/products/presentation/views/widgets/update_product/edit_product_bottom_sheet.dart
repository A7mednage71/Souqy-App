import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/helpers/my_validator.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/product_category_drop_down.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/product_image_listview.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/update_product/update_product_button.dart';

class EditProductBottomSheet extends StatelessWidget {
  const EditProductBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.h,
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        color: ColorsDark.blueDark,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              child: Text(
                'Update Product',
                style: context.textStyle.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Update a Photos',
              style: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            SizedBox(height: 10.h),
            const ProdutImagesListView(),
            SizedBox(height: 10.h),
            Text(
              'Tittle',
              style: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
              hintText: 'Enter a Tittle',
              validator: (value) {
                if (!MyValidator.isCategoryNameValid(value!)) {
                  return 'Please enter a valid Tittle';
                }
                return null;
              },
            ),
            SizedBox(height: 10.h),
            Text(
              'Price',
              style: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: TextEditingController(),
              keyboardType: TextInputType.number,
              hintText: 'Enter a price',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a price';
                }
                return null;
              },
            ),
            SizedBox(height: 10.h),
            Text(
              'Description',
              style: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
              maxLines: 3,
              hintText: 'Enter a description',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            const ProductCategoryDropButton(),
            SizedBox(height: 10.h),
            const UpdateProductButton(),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/helpers/my_validator.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/admin/products/presentation/bloc/update_product/update_product_bloc.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/update_product/update_product_button.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/update_product/update_product_images_listview.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/update_product/update_selected_category_drop_button.dart';

class UpdateProductForm extends StatelessWidget {
  const UpdateProductForm({
    this.product,
    super.key,
  });

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    final updateProductBloc = context.read<UpdateProductBloc>();
    return SingleChildScrollView(
      child: Form(
        key: updateProductBloc.formKey,
        autovalidateMode: AutovalidateMode.always,
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
            UpdateProdutImagesListView(product: product),
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
              controller: updateProductBloc.updateProductTitleController,
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
              controller: updateProductBloc.updateProductPriceController,
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
              controller: updateProductBloc.updateProductDescriptionController,
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
            UpdateSelectedCategoryDropButton(
              selectedCategory: product!.category!.name ?? '',
            ),
            SizedBox(height: 10.h),
            UpdateProductButton(product: product),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}

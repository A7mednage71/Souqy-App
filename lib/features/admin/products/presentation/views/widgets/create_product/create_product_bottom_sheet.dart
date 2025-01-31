import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/helpers/my_validator.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/core/style/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/products/presentation/bloc/create_product/create_product_bloc.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/create_product/create_product_button.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/create_product/create_product_images_listview.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/create_product/select_category_drop_down_button.dart';

class CreateProductBottomSheet extends StatelessWidget {
  const CreateProductBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final createProductBloc = context.read<CreateProductBloc>();
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
        child: Form(
          key: createProductBloc.formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: Text(
                  'Create Product',
                  style: context.textStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Pick Product Images',
                style: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              SizedBox(height: 10.h),
              const CreateProdutImagesListView(),
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
                controller: createProductBloc.productTitleController,
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
                controller: createProductBloc.productPriceController,
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
                controller: createProductBloc.productDescriptionController,
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
              const SelectCategoryDropDownButton(),
              SizedBox(height: 10.h),
              const CreateProductButton(),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}

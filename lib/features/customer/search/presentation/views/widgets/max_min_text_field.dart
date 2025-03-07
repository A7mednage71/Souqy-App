import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/features/customer/search/presentation/bloc/search_products/search_products_bloc.dart';

class MaxAndMinPriceTextField extends StatelessWidget {
  const MaxAndMinPriceTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchProductsBloc>();
    return Form(
      key: searchBloc.searchWithPriceFormKey,
      autovalidateMode: AutovalidateMode.always,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomFadeInRight(
              duration: 200,
              child: CustomTextField(
                controller: searchBloc.minPriceController,
                hintText: 'min Price',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter product price';
                  }
                  return null;
                },
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: CustomFadeInLeft(
              duration: 200,
              child: CustomTextField(
                controller: searchBloc.maxPriceController,
                hintText: 'max Price',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter product price';
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

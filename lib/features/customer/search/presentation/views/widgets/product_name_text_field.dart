import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/animations/animate_do.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/features/customer/search/presentation/bloc/search_products/search_products_bloc.dart';

class ProductNameTextField extends StatelessWidget {
  const ProductNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchProductsBloc>();
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: searchBloc.searchWithNameFormKey,
      child: CustomFadeInRight(
        duration: 200,
        child: CustomTextField(
          controller: searchBloc.productNameController,
          hintText: 'Enter Product Name',
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter product name';
            }
            return null;
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/admin/products/presentation/bloc/create_product/create_product_bloc.dart';

class ProductCategoryDropButton extends StatefulWidget {
  const ProductCategoryDropButton({
    this.createProductBloc,
    super.key,
  });
  final CreateProductBloc? createProductBloc;
  @override
  State<ProductCategoryDropButton> createState() =>
      _ProductCategoryDropButtonState();
}

class _ProductCategoryDropButtonState extends State<ProductCategoryDropButton> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      hint: const Text(
        'Choose Category',
        style: TextStyle(color: Colors.white),
      ),
      value: value,
      iconSize: 30.r,
      iconEnabledColor: context.themeColors.textColor,
      style: context.textStyle.copyWith(
        fontSize: 14.sp,
        color: Colors.white,
      ),
      validator: (value) {
        if (value == null) {
          return 'Please choose product category';
        }
        return null;
      },
      iconDisabledColor: Colors.transparent,
      dropdownColor: ColorsDark.navBarDark,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: context.themeColors.textFormBorder!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: context.themeColors.textFormBorder!),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      items: const [
        DropdownMenuItem(
          value: 'Category 1',
          child: Text('Category 1'),
        ),
        DropdownMenuItem(
          value: 'Category 2',
          child: Text('Category 2'),
        ),
      ],
      onChanged: (value) {
        setState(() {
          this.value = value;
          if (widget.createProductBloc != null) {
            widget.createProductBloc!.categoryId = value!;
          }
        });
      },
    );
  }
}

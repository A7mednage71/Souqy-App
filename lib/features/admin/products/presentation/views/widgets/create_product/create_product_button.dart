import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/admin/products/presentation/bloc/create_product/create_product_bloc.dart';
import 'package:my_store/features/auth/widgets/show_toast.dart';

class CreateProductButton extends StatelessWidget {
  const CreateProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        fixedSize: Size(double.maxFinite, 50.h),
      ),
      onPressed: () {
        validateCreateProduct(context);
      },
      child: Text(
        'Create Product',
        style: context.textStyle.copyWith(
          color: ColorsDark.blueDark,
          fontSize: 16.sp,
        ),
      ),
    );
  }

  void validateCreateProduct(BuildContext context) {
    final bloc = context.read<CreateProductBloc>();
    if (bloc.formKey.currentState!.validate()) {
      for (final element in bloc.images) {
        if (element.isEmpty || element == '') {
          ShowToast.showFailureToast(
            'Please pick three images to create a new product',
          );
          return;
        }
      }
      bloc.add(const CreateProductEvent.createProduct());
    }
  }
}

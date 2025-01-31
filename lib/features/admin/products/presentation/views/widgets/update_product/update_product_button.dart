import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_store/core/extensions/navigation_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/style/colors/colors_dark.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/admin/products/presentation/bloc/update_product/update_product_bloc.dart';
import 'package:my_store/features/auth/widgets/show_toast.dart';

class UpdateProductButton extends StatelessWidget {
  const UpdateProductButton({
    required this.product,
    super.key,
  });
  final ProductModel? product;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProductBloc, UpdateProductState>(
      listener: (context, state) {
        state.whenOrNull(
          failure: (message) {
            ShowToast.showFailureToast(
              message,
            );
          },
          success: (updateProductModel) {
            ShowToast.showSuccessToast(
              '${updateProductModel.title} updated successfully',
            );
            context.pop();
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                fixedSize: Size(double.maxFinite, 50.h),
              ),
              onPressed: null,
              child: const Center(
                child: SpinKitDualRing(
                  color: Colors.white,
                  size: 20,
                ),
              ),
            );
          },
          orElse: () {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                fixedSize: Size(double.maxFinite, 50.h),
              ),
              onPressed: () {
                validateUpdateProduct(context);
              },
              child: Text(
                'Update Product',
                style: context.textStyle.copyWith(
                  color: ColorsDark.blueDark,
                  fontSize: 16.sp,
                ),
              ),
            );
          },
        );
      },
    );
  }

  void validateUpdateProduct(BuildContext context) {
    final bloc = context.read<UpdateProductBloc>();
    if (bloc.formKey.currentState!.validate()) {
      bloc.add(UpdateProductEvent.updateProduct(productId: product!.id!));
    }
  }
}

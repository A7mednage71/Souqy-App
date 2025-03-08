import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/admin/products/presentation/bloc/update_product/update_product_bloc.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/update_product/update_product_form.dart';

class UpdateProductBottomSheet extends StatefulWidget {
  const UpdateProductBottomSheet({
    super.key,
    this.product,
  });
  final ProductModel? product;

  @override
  State<UpdateProductBottomSheet> createState() =>
      _UpdateProductBottomSheetState();
}

class _UpdateProductBottomSheetState extends State<UpdateProductBottomSheet> {
  @override
  void initState() {
    final updateProductBloc = context.read<UpdateProductBloc>();
    fillUpdateProductBlocController(updateProductBloc);
    super.initState();
  }

  void fillUpdateProductBlocController(UpdateProductBloc updateProductBloc) {
    if (widget.product != null) {
      updateProductBloc.updateProductTitleController.text =
          widget.product!.title!;
      updateProductBloc.updateProductPriceController.text =
          widget.product!.price.toString();
      updateProductBloc.updateProductDescriptionController.text =
          widget.product!.description!;
      updateProductBloc
        ..categoryId = widget.product!.category!.id.toString()
        ..updatedImages = widget.product!.images!;
    }
  }

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
        color: context.themeColors.bottomSheetBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: UpdateProductForm(
        product: widget.product,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/update_product/update_product_image.dart';

class UpdateProdutImagesListView extends StatelessWidget {
  const UpdateProdutImagesListView({
    super.key,
    this.product,
  });
  final ProductModel? product;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: index == 0 ? 0 : 10.w),
          child: UpdateProductImage(imageIndex: index, product: product),
        );
      },
    );
  }
}

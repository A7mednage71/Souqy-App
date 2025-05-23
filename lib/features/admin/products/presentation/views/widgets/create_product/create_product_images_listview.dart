import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/create_product/create_product_image.dart';

class CreateProdutImagesListView extends StatelessWidget {
  const CreateProdutImagesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: index == 0 ? 0 : 10.w),
          child: CreateProductImage(imageIndex: index),
        );
      },
    );
  }
}

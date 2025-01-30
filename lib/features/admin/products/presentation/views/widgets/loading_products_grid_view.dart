import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/product_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingProductsGridView extends StatelessWidget {
  const LoadingProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20.h,
          crossAxisSpacing: 10.w,
          childAspectRatio: 0.7,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return const ProductItem(product: null);
        },
      ),
    );
  }
}

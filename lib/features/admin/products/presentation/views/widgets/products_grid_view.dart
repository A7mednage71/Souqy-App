import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/product_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20.h,
          crossAxisSpacing: 10.w,
          childAspectRatio: 0.7,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ProductItem();
        },
      ),
    );
  }
}

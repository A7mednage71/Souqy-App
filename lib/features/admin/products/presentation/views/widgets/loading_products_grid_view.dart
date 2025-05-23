import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/product_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingProductsGridView extends StatelessWidget {
  const LoadingProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final products = List.generate(
      10,
      (index) => ProductModel(
        id: '0',
        title: 'Product $index',
        description: 'Description $index',
        images: ['https://picsum.photos/200/300'],
        price: 0,
        category: ProductCategory(id: '0', name: 'Category $index'),
      ),
    );
    return Skeletonizer(
      ignoreContainers: true,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20.h,
          crossAxisSpacing: 10.w,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
      ),
    );
  }
}

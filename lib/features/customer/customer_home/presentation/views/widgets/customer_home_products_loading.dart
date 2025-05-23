import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/admin/products/data/models/products_response_model.dart';
import 'package:my_store/features/customer/customer_home/presentation/views/widgets/customer_product_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomerHomeProductsLoading extends StatelessWidget {
  const CustomerHomeProductsLoading({super.key});

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
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.w,
          childAspectRatio: 0.6,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return CustomerProductItem(productModel: products[index]);
        },
      ),
    );
  }
}

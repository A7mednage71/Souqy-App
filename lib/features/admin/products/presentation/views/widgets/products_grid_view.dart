import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/screens/empty_data.dart';
import 'package:my_store/core/common/screens/failure_state.dart';
import 'package:my_store/features/admin/products/presentation/bloc/get_products/get_products_bloc.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/loading_products_grid_view.dart';
import 'package:my_store/features/admin/products/presentation/views/widgets/product_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GetProductsBloc, GetProductsState>(
        builder: (context, state) {
          return state.when(
            success: (products) {
              return products.isEmpty
                  ? const EmptyData()
                  : GridView.builder(
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
                    );
            },
            loading: () {
              return const LoadingProductsGridView();
            },
            failure: (message) {
              return const FailureState();
            },
            initial: SizedBox.shrink,
          );
        },
      ),
    );
  }
}

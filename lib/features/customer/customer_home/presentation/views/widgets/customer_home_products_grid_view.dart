import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/screens/empty_data.dart';
import 'package:my_store/core/common/screens/failure_state.dart';
import 'package:my_store/features/customer/customer_home/presentation/bloc/get_first_ten_products/get_first_ten_products_bloc.dart';
import 'package:my_store/features/customer/customer_home/presentation/views/widgets/customer_home_products_loading.dart';
import 'package:my_store/features/customer/customer_home/presentation/views/widgets/customer_product_item.dart';

class CustomerHomeProductsGridView extends StatelessWidget {
  const CustomerHomeProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFirstTenProductsBloc, GetFirstTenProductsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          failure: (message) => const FailureState(),
          loading: () => const CustomerHomeProductsLoading(),
          success: (products) {
            if (products.isEmpty) return const EmptyData();
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 15.w,
                childAspectRatio: 0.7,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return CustomerProductItem(productModel: products[index]);
              },
            );
          },
        );
      },
    );
  }
}

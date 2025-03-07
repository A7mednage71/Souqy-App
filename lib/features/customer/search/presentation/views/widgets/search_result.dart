import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/screens/empty_data.dart';
import 'package:my_store/core/common/screens/failure_state.dart';
import 'package:my_store/core/extensions/navigation_context.dart';
import 'package:my_store/core/routes/routes.dart';
import 'package:my_store/features/customer/customer_home/presentation/views/widgets/customer_home_products_loading.dart';
import 'package:my_store/features/customer/customer_home/presentation/views/widgets/customer_product_item.dart';
import 'package:my_store/features/customer/search/presentation/bloc/search_products/search_products_bloc.dart';
import 'package:my_store/features/customer/search/presentation/views/widgets/search_lottie.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductsBloc, SearchProductsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SearchLottie(),
          failure: (message) => const FailureState(),
          loading: () => const CustomerHomeProductsLoading(),
          success: (products) {
            if (products.isEmpty) return const EmptyData();
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.w,
                childAspectRatio: 0.65,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      Routes.productDetails,
                      arguments: products[index],
                    );
                  },
                  child: CustomerProductItem(productModel: products[index]),
                );
              },
            );
          },
        );
      },
    );
  }
}

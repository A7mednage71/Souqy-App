import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/screens/empty_data.dart';
import 'package:my_store/core/common/screens/failure_state.dart';
import 'package:my_store/core/common/widgets/custom_appbar_with_gradient_back_button.dart';
import 'package:my_store/core/extensions/navigation_context.dart';
import 'package:my_store/core/routes/routes.dart';
import 'package:my_store/features/admin/categories/data/models/categories_response_model.dart';
import 'package:my_store/features/customer/category_products/presentation/bloc/get_category_products/get_category_products_bloc.dart';
import 'package:my_store/features/customer/customer_home/presentation/views/widgets/customer_home_products_loading.dart';
import 'package:my_store/features/customer/customer_home/presentation/views/widgets/customer_product_item.dart';

class CategorySpecificProductsScreen extends StatelessWidget {
  const CategorySpecificProductsScreen({required this.category, super.key});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWithGradientBackButton(title: category.name),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: BlocBuilder<GetCategoryProductsBloc, GetCategoryProductsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              failure: (message) => const FailureState(),
              loading: () => const CustomerHomeProductsLoading(),
              success: (products) {
                if (products.isEmpty) return const EmptyData();
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 15.w,
                    childAspectRatio: 0.7,
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
        ),
      ),
    );
  }
}

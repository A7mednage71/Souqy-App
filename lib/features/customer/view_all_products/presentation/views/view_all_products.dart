import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/screens/empty_data.dart';
import 'package:my_store/core/common/screens/failure_state.dart';
import 'package:my_store/core/common/widgets/custom_appbar_with_gradient_back_button.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';
import 'package:my_store/features/customer/customer_home/presentation/views/widgets/customer_home_products_loading.dart';
import 'package:my_store/features/customer/view_all_products/presentation/bloc/get_all_products/get_all_products_with_pagination_bloc.dart';
import 'package:my_store/features/customer/view_all_products/presentation/views/widgets/all_products_grid_view.dart';

class ViewAllProducts extends StatelessWidget {
  const ViewAllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWithGradientBackButton(
        title: context.translate(LocalizationKeys.viewAll),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: BlocBuilder<GetAllProductsWithPaginationBloc,
            GetAllProductsWithPaginationState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              failure: (message) => const FailureState(),
              loading: () => const CustomerHomeProductsLoading(),
              success: (products) {
                if (products.isEmpty) return const EmptyData();
                return AllProductsGridView(products: products);
              },
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/style/images/app_images.dart';
import 'package:my_store/features/admin/dashboard/views/bloc/number_of_products/fetch_number_of_products_bloc.dart';
import 'package:my_store/features/admin/dashboard/views/presentation/widgets/dashboard_item.dart';

class ProductsDashboarditem extends StatelessWidget {
  const ProductsDashboarditem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNumberOfProductsBloc, FetchNumberOfProductsState>(
      builder: (context, state) {
        return state.when(
          loading: () {
            return const DashboardItem(
              title: 'Products',
              count: '0',
              image: AppImages.imagesAdminProductsDrawer,
            );
          },
          success: (count) {
            return DashboardItem(
              title: 'Products',
              count: count,
              image: AppImages.imagesAdminProductsDrawer,
            );
          },
          failure: (message) {
            return const DashboardItem(
              title: 'Products',
              count: 'N/A',
              image: AppImages.imagesAdminProductsDrawer,
            );
          },
        );
      },
    );
  }
}

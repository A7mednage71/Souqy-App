import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/style/images/app_images.dart';
import 'package:my_store/features/admin/dashboard/views/bloc/number_of_categories/fetch_number_of_categories_bloc.dart';
import 'package:my_store/features/admin/dashboard/views/presentation/widgets/dashboard_item.dart';

class CategoriesDashboardItem extends StatelessWidget {
  const CategoriesDashboardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNumberOfCategoriesBloc,
        FetchNumberOfCategoriesState>(
      builder: (context, state) {
        return state.when(
          loading: () {
            return const DashboardItem(
              title: 'Categories',
              count: '0',
              image: AppImages.imagesAdminCategoriesDrawer,
              isloading: true,
            );
          },
          success: (count) {
            return DashboardItem(
              title: 'Categories',
              count: count,
              image: AppImages.imagesAdminCategoriesDrawer,
            );
          },
          failure: (message) {
            return const DashboardItem(
              title: 'Categories',
              count: 'N/A',
              image: AppImages.imagesAdminCategoriesDrawer,
            );
          },
        );
      },
    );
  }
}

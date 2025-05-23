import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/admin/dashboard/views/bloc/number_of_categories/fetch_number_of_categories_bloc.dart';
import 'package:my_store/features/admin/dashboard/views/bloc/number_of_products/fetch_number_of_products_bloc.dart';
import 'package:my_store/features/admin/dashboard/views/bloc/number_of_users/fetch_number_of_users_bloc.dart';
import 'package:my_store/features/admin/dashboard/views/presentation/widgets/categories_dash_item.dart';
import 'package:my_store/features/admin/dashboard/views/presentation/widgets/products_dash_item.dart';
import 'package:my_store/features/admin/dashboard/views/presentation/widgets/users_dash_item.dart';

class DashBoardScreenBody extends StatelessWidget {
  const DashBoardScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        refreshDahsboardItemsValue(context);
      },
      child: ListView(
        children: [
          const ProductsDashboarditem(),
          SizedBox(
            height: 20.h,
          ),
          const CategoriesDashboardItem(),
          SizedBox(
            height: 20.h,
          ),
          const UsersDashboardItem(),
        ],
      ),
    );
  }

  void refreshDahsboardItemsValue(BuildContext context) {
    context
        .read<FetchNumberOfProductsBloc>()
        .add(const FetchNumberOfProductsEvent.fetchNumberOfProducts());
    context
        .read<FetchNumberOfCategoriesBloc>()
        .add(const FetchNumberOfCategoriesEvent.fetchNumberOfCategories());
    context
        .read<FetchNumberOfUsersBloc>()
        .add(const FetchNumberOfUsersEvent.fetchNumberOfUsers());
  }
}

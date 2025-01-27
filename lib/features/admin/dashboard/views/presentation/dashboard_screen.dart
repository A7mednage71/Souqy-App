import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/common/widgets/custom_admin_appbar.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/admin/dashboard/views/bloc/number_of_categories/fetch_number_of_categories_bloc.dart';
import 'package:my_store/features/admin/dashboard/views/bloc/number_of_products/fetch_number_of_products_bloc.dart';
import 'package:my_store/features/admin/dashboard/views/bloc/number_of_users/fetch_number_of_users_bloc.dart';
import 'package:my_store/features/admin/dashboard/views/presentation/widgets/dashboard_screen_body.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<FetchNumberOfProductsBloc>()
            ..add(const FetchNumberOfProductsEvent.fetchNumberOfProducts()),
        ),
        BlocProvider(
          create: (context) => getIt<FetchNumberOfCategoriesBloc>()
            ..add(const FetchNumberOfCategoriesEvent.fetchNumberOfCategories()),
        ),
        BlocProvider(
          create: (context) => getIt<FetchNumberOfUsersBloc>()
            ..add(const FetchNumberOfUsersEvent.fetchNumberOfUsers()),
        ),
      ],
      child: const Scaffold(
        appBar: CustomAdminAppBar(title: 'Dashboard'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: DashBoardScreenBody(),
        ),
      ),
    );
  }
}

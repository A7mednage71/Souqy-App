import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/common/widgets/custom_admin_appbar.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/admin/dashboard/data/repos/dashboard_repo.dart';
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
          create: (context) => FetchNumberOfProductsBloc(getIt<DashboardRepo>())
            ..add(const FetchNumberOfProductsEvent.fetchNumberOfProducts()),
        ),
        BlocProvider(
          create: (context) => FetchNumberOfCategoriesBloc(
            getIt<DashboardRepo>(),
          )..add(const FetchNumberOfCategoriesEvent.fetchNumberOfCategories()),
        ),
        BlocProvider(
          create: (context) => FetchNumberOfUsersBloc(getIt<DashboardRepo>())
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

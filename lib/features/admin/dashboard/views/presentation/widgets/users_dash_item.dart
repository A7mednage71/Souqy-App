import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/style/images/app_images.dart';
import 'package:my_store/features/admin/dashboard/views/bloc/number_of_users/fetch_number_of_users_bloc.dart';
import 'package:my_store/features/admin/dashboard/views/presentation/widgets/dashboard_item.dart';

class UsersDashboardItem extends StatelessWidget {
  const UsersDashboardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNumberOfUsersBloc, FetchNumberOfUsersState>(
      builder: (context, state) {
        return state.when(
          loading: () {
            return const DashboardItem(
              title: 'Users',
              count: '0',
              image: AppImages.imagesAdminUsersDrawer,
            );
          },
          success: (count) {
            return DashboardItem(
              title: 'Users',
              count: count,
              image: AppImages.imagesAdminUsersDrawer,
            );
          },
          failure: (message) {
            return const DashboardItem(
              title: 'Users',
              count: 'N/A',
              image: AppImages.imagesAdminUsersDrawer,
            );
          },
        );
      },
    );
  }
}

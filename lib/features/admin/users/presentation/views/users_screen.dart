import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_admin_appbar.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/features/admin/users/presentation/bloc/delete_user/delete_user_bloc.dart';
import 'package:my_store/features/admin/users/presentation/bloc/get_users/get_users_bloc.dart';
import 'package:my_store/features/admin/users/presentation/views/widgets/get_users_table_data_bloc_builder.dart';
import 'package:my_store/features/admin/users/presentation/views/widgets/search_for_users.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<GetUsersBloc>()..add(const GetUsersEvent.getUsers()),
        ),
        BlocProvider(
          create: (context) => getIt<DeleteUserBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: const CustomAdminAppBar(title: 'Users'),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                context.themeAssets.homeBg!,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              children: [
                const SearchForUser(),
                SizedBox(height: 20.h),
                const Expanded(child: GetUsersTabledataBlocBuilder()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

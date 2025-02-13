import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/common/screens/empty_data.dart';
import 'package:my_store/core/common/screens/failure_state.dart';
import 'package:my_store/features/admin/users/presentation/bloc/get_users/get_users_bloc.dart';
import 'package:my_store/features/admin/users/presentation/views/widgets/users_table.dart';
import 'package:my_store/features/admin/users/presentation/views/widgets/users_table_loading.dart';

class GetUsersTabledataBlocBuilder extends StatelessWidget {
  const GetUsersTabledataBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUsersBloc, GetUsersState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            return const SizedBox.shrink();
          },
          failure: (message) {
            return const FailureState();
          },
          success: (users) {
            if (users.isEmpty) {
              return const EmptyData();
            }
            return UsersTable(users: users);
          },
          loading: () {
            return const UsersTableLoading();
          },
        );
      },
    );
  }
}

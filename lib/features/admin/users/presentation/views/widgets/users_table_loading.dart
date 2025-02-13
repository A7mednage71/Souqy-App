import 'package:flutter/material.dart';
import 'package:my_store/features/admin/users/data/models/get_users_response_model.dart';
import 'package:my_store/features/admin/users/presentation/views/widgets/users_table.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UsersTableLoading extends StatelessWidget {
  const UsersTableLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final users = List<UserModel>.generate(
      5,
      (index) => UserModel(
        userEmail: 'skeletonizer@email',
        userName: 'skeletonizer',
        userId: 'skeletonizer',
      ),
    );

    return Skeletonizer(
      child: UsersTable(
        users: users,
      ),
    );
  }
}

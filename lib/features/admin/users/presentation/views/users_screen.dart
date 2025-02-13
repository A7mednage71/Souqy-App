import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_admin_appbar.dart';
import 'package:my_store/features/admin/users/presentation/views/widgets/search_for_users.dart';
import 'package:my_store/features/admin/users/presentation/views/widgets/users_table.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAdminAppBar(title: 'Users'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            const SearchForUser(),
            SizedBox(height: 20.h),
            const UsersTable(),
          ],
        ),
      ),
    );
  }
}

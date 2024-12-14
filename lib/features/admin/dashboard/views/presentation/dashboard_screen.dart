import 'package:flutter/material.dart';
import 'package:my_store/core/common/widgets/custom_admin_appbar.dart';
import 'package:my_store/features/admin/dashboard/views/presentation/widgets/dashboard_screen_body.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAdminAppBar(title: 'Dashboard'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: DashBoardScreenBody(),
      ),
    );
  }
}

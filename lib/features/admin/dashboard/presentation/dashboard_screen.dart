import 'package:flutter/material.dart';
import 'package:my_store/core/common/widgets/custom_admin_appbar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAdminAppBar(title: 'Dashboard'),
      body: Center(
        child: Text('Dashboard Screen'),
      ),
    );
  }
}

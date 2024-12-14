import 'package:flutter/material.dart';
import 'package:my_store/core/common/widgets/custom_admin_appbar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAdminAppBar(title: 'Notifications'),
      body: Center(
        child: Text('Notifications Screen'),
      ),
    );
  }
}

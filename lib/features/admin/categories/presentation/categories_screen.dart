import 'package:flutter/material.dart';
import 'package:my_store/core/common/widgets/custom_admin_appbar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAdminAppBar(title: 'Categories'),
      body: Center(
        child: Text('Categories Screen'),
      ),
    );
  }
}

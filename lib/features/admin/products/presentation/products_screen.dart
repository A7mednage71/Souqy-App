import 'package:flutter/material.dart';
import 'package:my_store/core/common/widgets/custom_admin_appbar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAdminAppBar(title: 'Products'),
      body: Center(
        child: Text('Products Screen'),
      ),
    );
  }
}

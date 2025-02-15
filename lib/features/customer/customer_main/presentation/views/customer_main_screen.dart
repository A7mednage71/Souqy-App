import 'package:flutter/material.dart';
import 'package:my_store/features/customer/customer_main/presentation/views/widgets/customer_app_bar.dart';

class CustomerMainScreen extends StatelessWidget {
  const CustomerMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomerAppBar(),
    );
  }
}

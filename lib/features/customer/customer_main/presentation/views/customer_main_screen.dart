import 'package:flutter/material.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/features/customer/customer_main/presentation/views/widgets/customer_app_bar.dart';
import 'package:my_store/features/customer/customer_main/presentation/views/widgets/customer_bottom_nav_bar.dart';

class CustomerMainScreen extends StatelessWidget {
  const CustomerMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomerAppBar(),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              context.themeAssets.homeBg!,
            ),
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomerBottomNavBar(),
          ],
        ),
      ),
    );
  }
}

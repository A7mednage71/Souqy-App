import 'package:flutter/material.dart';
import 'package:my_store/core/style/images/app_images.dart';

class NoNetworkConnetion extends StatelessWidget {
  const NoNetworkConnetion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppImages.imagesCoreNoConnection),
          ),
        ),
      ),
    );
  }
}

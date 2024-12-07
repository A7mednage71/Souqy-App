import 'package:flutter/material.dart';
import 'package:my_store/core/extensions/localization_context.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/core/languages/localization_keys.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeColors.mainColor,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Text(context.translate(LocalizationKeys.appName)),
      ),
    );
  }
}

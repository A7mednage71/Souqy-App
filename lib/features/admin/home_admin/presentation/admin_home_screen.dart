import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_store/core/extensions/theme_context.dart';
import 'package:my_store/features/admin/dashboard/views/presentation/dashboard_screen.dart';
import 'package:my_store/features/admin/home_admin/presentation/menu_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  Widget mainScreen = const DashboardScreen();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      borderRadius: 24,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      duration: const Duration(milliseconds: 500),
      showShadow: true,
      drawerShadowsBackgroundColor:
          context.themeColors.mainColor!.withOpacity(0.6),
      menuBackgroundColor: context.themeColors.bluePinkLight!,
      mainScreen: mainScreen,
      menuScreen: MenuScreen(
        onPageChanged: (page) {
          setState(() {
            mainScreen = page;
          });
        },
      ),
    );
  }
}

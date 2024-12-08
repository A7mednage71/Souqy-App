import 'package:flutter/material.dart';
import 'package:my_store/core/common/screens/no_route_screen.dart';
import 'package:my_store/core/routes/base_material_page_route.dart';
import 'package:my_store/core/routes/routes.dart';
import 'package:my_store/features/auth/login/presentation/views/login_screen.dart';
import 'package:my_store/home_screen.dart';

class AppRouter {
  static Route<void> getRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case Routes.home:
        return BaseRoute(page: const HomeScreen());
      case Routes.login:
        return BaseRoute(page: const LoginScreen());
      default:
        return BaseRoute(page: const NoRouteScreen());
    }
  }
}

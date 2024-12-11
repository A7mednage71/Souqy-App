import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:my_store/core/app/upload_image/repos/upload_image_repo.dart';
import 'package:my_store/core/common/screens/no_route_screen.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/routes/base_material_page_route.dart';
import 'package:my_store/core/routes/routes.dart';
import 'package:my_store/features/admin/admin_home.dart';
import 'package:my_store/features/auth/login/data/repos/login_repo.dart';
import 'package:my_store/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:my_store/features/auth/login/presentation/views/login_screen.dart';
import 'package:my_store/features/auth/register/presentation/views/sighn_up_screen.dart';
import 'package:my_store/features/customer/customer_home.dart';

class AppRouter {
  static Route<void> getRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case Routes.homeAdmin:
        return BaseRoute(page: const AdminHomeScreen());
      case Routes.homeCustomer:
        return BaseRoute(page: const CustomerHomeScreen());
      case Routes.login:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => LoginBloc(getIt<LoginRepo>()),
            child: const LoginScreen(),
          ),
        );
      case Routes.sighnUp:
        return BaseRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => UploadImageCubit(getIt<UploadImageRepo>()),
              ),
            ],
            child: const SighnUpScreen(),
          ),
        );
      default:
        return BaseRoute(page: const NoRouteScreen());
    }
  }
}

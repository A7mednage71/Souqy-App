import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:my_store/core/app/upload_image/repos/upload_image_repo.dart';
import 'package:my_store/core/common/screens/no_route_screen.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/routes/base_material_page_route.dart';
import 'package:my_store/core/routes/routes.dart';
import 'package:my_store/features/admin/home_admin/presentation/admin_home_screen.dart';
import 'package:my_store/features/auth/login/data/repos/login_repo.dart';
import 'package:my_store/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:my_store/features/auth/login/presentation/views/login_screen.dart';
import 'package:my_store/features/auth/register/data/repos/sighn_up_repo.dart';
import 'package:my_store/features/auth/register/presentation/bloc/sighn_up_bloc.dart';
import 'package:my_store/features/auth/register/presentation/views/sighn_up_screen.dart';
import 'package:my_store/features/customer/customer_main/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:my_store/features/customer/customer_main/presentation/views/customer_main_screen.dart';
import 'package:my_store/features/customer/profile/presentation/views/build_developer_web_view.dart';

class AppRouter {
  static Route<void> getRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
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
              BlocProvider(
                create: (context) => SighnUpBloc(getIt<SighnUpRepo>()),
              ),
            ],
            child: const SighnUpScreen(),
          ),
        );
      case Routes.homeAdmin:
        return BaseRoute(page: const AdminHomeScreen());
      case Routes.customerMainScreen:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => getIt<BottomNavigationCubit>(),
            child: const CustomerMainScreen(),
          ),
        );
      case Routes.buildDeveloperWebView:
        return BaseRoute(
          page: const BuildDeveloperWebView(),
        );
      default:
        return BaseRoute(page: const NoRouteScreen());
    }
  }
}

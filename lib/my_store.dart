import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/app_cubit/cubit/app_cubit.dart';
import 'package:my_store/core/app/network_connection_checker.dart';
import 'package:my_store/core/common/screens/no_network_connection.dart';
import 'package:my_store/core/constants/app_constants.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/languages/app_localizations_setup.dart';
import 'package:my_store/core/routes/app_router.dart';
import 'package:my_store/core/routes/routes.dart';
import 'package:my_store/core/services/shared_pref/shared_pref.dart';
import 'package:my_store/core/services/shared_pref/shared_pref_keys.dart';
import 'package:my_store/core/style/theme/app_theme.dart';
import 'package:my_store/features/customer/favorites/presentation/cubit/favorites_cubit.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyStore extends StatelessWidget {
  const MyStore({super.key});
  @override
  Widget build(BuildContext context) {
    final userRole = SharedPrefService.getString(SharedPrefKeys.userRole);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<AppCubit>()
                ..loadTheme()
                ..loadLanguage(),
            ),
            BlocProvider(
              create: (context) =>
                  getIt<FavoritesCubit>()..getFavoritesProducts(),
            ),
          ],
          child: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              final isDarkTheme = context.read<AppCubit>().isDarkTheme;
              final language = context.read<AppCubit>().language;
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'My Store',
                theme:
                    isDarkTheme ? AppTheme.darkTheme() : AppTheme.lightTheme(),
                onGenerateRoute: AppRouter.getRoute,
                initialRoute: AppConstants.isUserlogged
                    ? userRole == 'customer'
                        ? Routes.customerMainScreen
                        : Routes.homeAdmin
                    : Routes.login,
                navigatorKey: navigatorKey,
                locale: Locale(language),
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                builder: (context, widget) {
                  return ValueListenableBuilder(
                    valueListenable:
                        NetworkConnectionChecker.instance.isConnected,
                    builder: (context, value, child) {
                      if (value) {
                        return GestureDetector(
                          onTap: () =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                          child: widget,
                        );
                      } else {
                        return const NoNetworkConnetion();
                      }
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

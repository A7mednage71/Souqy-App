import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/app_cubit/cubit/app_cubit.dart';
import 'package:my_store/core/app/network_connection_checker.dart';
import 'package:my_store/core/common/screens/no_network_connection.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/languages/app_localizations_setup.dart';
import 'package:my_store/core/routes/app_router.dart';
import 'package:my_store/core/routes/routes.dart';
import 'package:my_store/core/style/theme/app_theme.dart';

class MyStore extends StatelessWidget {
  const MyStore({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => getIt<AppCubit>()..loadTheme(),
          child: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              final isDarkTheme = context.read<AppCubit>().isDarkTheme;
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'My Store',
                theme: isDarkTheme ? AppTheme.darkTheme : AppTheme.lightTheme,
                onGenerateRoute: AppRouter.getRoute,
                initialRoute: Routes.login,
                navigatorKey: GlobalKey<NavigatorState>(),
                locale: const Locale('en'),
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

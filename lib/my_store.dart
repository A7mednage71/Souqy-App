import 'package:flutter/material.dart';
import 'package:my_store/core/app/network_connection_checker.dart';
import 'package:my_store/core/common/screens/no_network_connection.dart';
import 'package:my_store/core/routes/app_router.dart';
import 'package:my_store/core/routes/routes.dart';

class MyStore extends StatelessWidget {
  const MyStore({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRouter.getRoute,
      initialRoute: Routes.home,
      navigatorKey: GlobalKey<NavigatorState>(),
      builder: (context, widget) {
        return ValueListenableBuilder(
          valueListenable: NetworkConnectionChecker.instance.isConnected,
          builder: (context, value, child) {
            if (value) {
              return widget!;
            } else {
              return const NoNetworkConnetion();
            }
          },
        );
      },
    );

    // : MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'No Network Connection',
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
    //       useMaterial3: true,
    //     ),
    //     home: const NoNetworkConnetion(),
    //   );
  }
}

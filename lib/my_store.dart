import 'package:flutter/material.dart';
import 'package:my_store/core/app/network_connection_checker.dart';
import 'package:my_store/core/common/screens/no_network_connection.dart';

class MyStore extends StatelessWidget {
  const MyStore({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: NetworkConnectionChecker.instance.isConnected,
      builder: (context, isConnected, child) {
        return isConnected
            ? MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'My Store',
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
                  useMaterial3: true,
                ),
                home: const Scaffold(
                  body: Center(
                    child: Text('My Store'),
                  ),
                ),
              )
            : MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'No Network Connection',
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
                  useMaterial3: true,
                ),
                home: const NoNetworkConnetion(),
              );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_store/core/common/screens/no_network_connection.dart';

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
      home: const NoNetworkConnetion(),
      // home: const Scaffold(
      //   body: Center(
      //     child: Text('My Store'),
      //   ),
      // ),
    );
  }
}

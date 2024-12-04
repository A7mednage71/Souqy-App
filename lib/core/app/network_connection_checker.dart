import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkConnectionChecker {
  NetworkConnectionChecker._();

  static NetworkConnectionChecker instance = NetworkConnectionChecker._();

  // create a notifier to update the UI
  ValueNotifier<bool> isConnected = ValueNotifier(false);

  // create connective instance
  final Connectivity _connectivity = Connectivity();

  // initialize the network connection checker
  Future<void> init() async {
    final result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // check the network connection
  void _updateConnectionStatus(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile)) {
      isConnected.value = true;
    } else {
      isConnected.value = false;
    }
  }
}

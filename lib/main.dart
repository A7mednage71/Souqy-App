import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/bloc_observer.dart';
import 'package:my_store/core/app/env_variables.dart';
import 'package:my_store/core/app/network_connection_checker.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/services/cloud_messaging/firebase_messaging_helper.dart';
import 'package:my_store/core/services/hive_database/hive_database.dart';
import 'package:my_store/core/services/shared_pref/shared_pref.dart';
import 'package:my_store/firebase_options.dart';
import 'package:my_store/my_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EnvVariables.init(envType: EnvType.dev);
  await NetworkConnectionChecker.instance.init();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = AppBlocObserver();
  await setGetIt();
  await SharedPrefService.instantiatePreferences();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  );
  await HiveDatabase.init();
  await FirebaseMessagingHelper.instance.initNotifications();
  runApp(const MyStore());
}

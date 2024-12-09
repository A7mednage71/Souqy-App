import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/bloc_observer.dart';
import 'package:my_store/core/app/env_variables.dart';
import 'package:my_store/core/app/network_connection_checker.dart';
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
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  );
  runApp(const MyStore());
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_store/firebase_options.dart';
import 'package:my_store/my_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyStore());
}

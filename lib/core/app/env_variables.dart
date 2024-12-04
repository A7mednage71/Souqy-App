import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvVariables {
  EnvVariables._();

  static EnvVariables instance = EnvVariables._();

  // get env type
  String get envType => dotenv.get('ENV_TYPE');

  // initialize variables
  static Future<void> init({required EnvType envType}) async {
    switch (envType) {
      case EnvType.dev:
        await dotenv.load(fileName: '.env.dev');
      case EnvType.prod:
        await dotenv.load(fileName: '.env.prod');
    }
  }
}

enum EnvType { dev, prod }

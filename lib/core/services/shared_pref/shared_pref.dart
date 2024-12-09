import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  SharedPrefService._();

  /// Removes a value from SharedPreferences with given [key].
  static Future<void> removeData(String key) async {
    debugPrint('SharedPrefHelper : data with key : $key has been removed');
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static Future<void> clearAllData() async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static Future<void> setData(String key, dynamic value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper : setData with key : $key and value : $value');
    switch (value.runtimeType) {
      case String:
        await sharedPreferences.setString(key, value as String);
      case int:
        await sharedPreferences.setInt(key, value as int);
      case bool:
        await sharedPreferences.setBool(key, value as bool);
      case double:
        await sharedPreferences.setDouble(key, value as double);
      default:
        return;
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static Future<bool> getBool(String key) async {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static Future<double> getDouble(String key) async {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static Future<int> getInt(String key) async {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets an String value from SharedPreferences with given [key].
  static Future<String> getString(String key) async {
    debugPrint('SharedPrefHelper : getString with key : $key');
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }
}

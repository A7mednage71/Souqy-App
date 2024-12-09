import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/services/shared_pref/shared_pref.dart';
import 'package:my_store/core/services/shared_pref/shared_pref_keys.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());

  bool isDarkTheme = false;
  String language = 'en';

  /// Load theme from SharedPreferences
  Future<void> loadTheme() async {
    isDarkTheme = await SharedPrefService.getBool(
      SharedPrefKeys.appMode,
    );
    emit(AppState.themeChanged(isDarkTheme: isDarkTheme));
  }

  /// Toggle theme and save to SharedPreferences
  Future<void> toggleTheme() async {
    emit(const AppState.initial());
    isDarkTheme = !isDarkTheme;
    await SharedPrefService.setData(
      SharedPrefKeys.appMode,
      isDarkTheme,
    );
    emit(AppState.themeChanged(isDarkTheme: isDarkTheme));
  }

  /// Load language from SharedPreferences
  Future<void> loadLanguage() async {
    language = await SharedPrefService.isfound(SharedPrefKeys.language)
        ? await SharedPrefService.getString(
            SharedPrefKeys.language,
          )
        : 'en';
    emit(AppState.languageChanged(locale: Locale(language)));
  }

  /// Change language and save to SharedPreferences
  Future<void> changeLanguage(String newLanguage) async {
    emit(const AppState.initial());
    language = newLanguage;
    await SharedPrefService.setData(
      SharedPrefKeys.language,
      newLanguage,
    );
    emit(AppState.languageChanged(locale: Locale(newLanguage)));
  }

  void changeLanguageToArabic() => changeLanguage('ar');

  void changeLanguageToEnglish() => changeLanguage('en');
}

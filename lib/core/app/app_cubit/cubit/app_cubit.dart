import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/services/shared_pref/shared_pref.dart';
import 'package:my_store/core/services/shared_pref/shared_pref_keys.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());

  bool isDarkTheme = false;

  // Load theme from SharedPreferences
  Future<void> loadTheme() async {
    isDarkTheme = await SharedPrefService.getBool(
      SharedPrefKeys.appMode,
    );
    emit(AppState.themeChanged(isDarkTheme: isDarkTheme));
  }

  // Toggle theme and save to SharedPreferences
  Future<void> toggleTheme() async {
    emit(const AppState.initial());
    isDarkTheme = !isDarkTheme;
    await SharedPrefService.setData(
      SharedPrefKeys.appMode,
      isDarkTheme,
    );
    emit(AppState.themeChanged(isDarkTheme: isDarkTheme));
  }
}

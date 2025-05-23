part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial() = _Initial;
  const factory AppState.themeChanged({required bool isDarkTheme}) =
      _ThemeChanged;
  const factory AppState.languageChanged({required Locale locale}) =
      _LanguageChanged;
}

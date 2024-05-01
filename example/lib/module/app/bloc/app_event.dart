part of "app_bloc.dart";

/// Event for AppBloc
@freezed
class AppEvent with _$AppEvent {
  /// Event app change [ThemeMode] light, dark,...
  const factory AppEvent.changeThemeMode(ThemeMode themeMode) = _ChangeThemMode;

  /// Event app change [Locale] ko, en,...
  const factory AppEvent.changeLocale(Locale locale) = _ChangeLocale;

  const AppEvent._();
}

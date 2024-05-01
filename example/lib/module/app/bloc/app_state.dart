part of "app_bloc.dart";

/// State of [AppBloc]
@freezed
class AppState with _$AppState {
  /// Create an AppState
  const factory AppState({
    @ConvertToThemeMode() @Default(ThemeMode.light) ThemeMode themeMode,
    @ConvertToLocale() @Default(Locale("en")) Locale locale,
  }) = _AppState;

  const AppState._();

  /// Create an AppState from JSON
  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}

/// Convert field [ThemeMode] of Class to [int] of JSON
class ConvertToThemeMode implements JsonConverter<ThemeMode, int> {
  /// Create a ConvertToBool
  const ConvertToThemeMode();

  @override
  ThemeMode fromJson(int json) => ThemeMode.values.elementAt(json);

  @override
  int toJson(ThemeMode object) => object.index;
}

/// Convert field [Locale] of Class to [String] of JSON
class ConvertToLocale implements JsonConverter<Locale, String> {
  /// Create a ConvertToBool
  const ConvertToLocale();

  @override
  Locale fromJson(String json) => Locale(json);

  @override
  String toJson(Locale object) => object.languageCode;
}

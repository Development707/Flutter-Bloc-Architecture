import "package:bloc_architecture_core/bloc_architecture_core.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";

import "../theme/theme.dart";

/// Common get value with BuildContext
extension ContextExtension on BuildContext {
  /// Callers can lookup localized strings with an instance of AppLocalizations
  AppLocalizations get l10n => AppLocalizations.of(this);

  /// App design [AppColors], [ThemeMode], [Locale].
  AppThemeData get appTheme => AppThemeData.of(this);

  /// similar to [AppThemeData.of(context).appColors]
  AppColors get appColors => appTheme.appColors;

  /// similar to [AppThemeData.of(context).themeMode]
  ThemeMode? get themeMode => appTheme.themeMode;

  /// similar to [AppThemeData.of(context).locale]
  Locale? get locale => appTheme.locale;

  /// Check if dark mode theme is enable
  bool get isDarkTheme {
    return themeMode == ThemeMode.dark || themeMode == ThemeMode.system && platformBrightness == Brightness.dark;
  }
}

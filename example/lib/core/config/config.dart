import "package:flutter/foundation.dart";
import "package:injectable/injectable.dart";

export "injector.dart";

/// Config app with default value or load from environment
class Config {
  Config._();

  /// Enable log when debug app
  static const bool enableGeneralLog = kDebugMode;

  /// Log json pretty
  static const bool isPrettyJson = kDebugMode;

  /// Used to annotate dependencies which are registered under certain environment
  static Environment? get environment => switch (const String.fromEnvironment("FLAVOR").toLowerCase()) {
        Environment.dev => dev,
        Environment.test => test,
        Environment.prod => prod,
        String() => null,
      };

  /// Network base url from environment
  static const String baseUrl = String.fromEnvironment("BASE_URL");

  /// Api key
  static const String apiKey = String.fromEnvironment("API_KEY");

  /// Network timeout 10s
  static const Duration timeout = Duration(seconds: 10);

  /// Bloc log when change state
  static const bool logOnBlocChange = kDebugMode;

  /// Bloc log when create
  static const bool logOnBlocCreate = kDebugMode;

  /// Bloc log when close
  static const bool logOnBlocClose = kDebugMode;

  /// Bloc log when error
  static const bool logOnBlocError = kDebugMode;

  /// Bloc log when add event
  static const bool logOnBlocEvent = kDebugMode;

  /// Bloc log when transition
  static const bool logOnBlocTransition = kDebugMode;

  /// Navigator enable page error
  static const bool enableErrorPage = kReleaseMode;

  /// Navigator enable log
  static const bool enableNavigatorObserverLog = kDebugMode;
}

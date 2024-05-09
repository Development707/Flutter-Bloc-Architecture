import "package:bloc_architecture_core/bloc_architecture_core.dart";
import "package:bloc_architecture_localization/bloc_architecture_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";

import "../../core/config/config.dart";
import "../../core/theme/theme.dart";
import "../../router/router.dart";
import "bloc/app_bloc.dart";
import "page/error_page.dart";

/// Creates a [MaterialApp] that uses the [RouterConfig] instead of a [Navigator].
class App extends StatelessWidget {
  /// Create an App
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      bloc: getIt.get<AppBloc>(),
      builder: (BuildContext context, AppState state) {
        final bool isDarkTheme = state.themeMode == ThemeMode.dark ||
            state.themeMode == ThemeMode.system && context.platformBrightness == Brightness.dark;

        return AppThemeData(
          locale: state.locale,
          themeMode: state.themeMode,
          appColors: isDarkTheme ? AppColors.dark() : const AppColors.light(),
          child: Builder(builder: buildApp),
        );
      },
    );
  }

  /// Build [MaterialApp]
  Widget buildApp(BuildContext context) {
    return MaterialApp.router(
      themeMode: AppThemeData.of(context).themeMode,
      theme: AppThemes.themeData,
      darkTheme: AppThemes.darkThemeData,
      locale: AppThemeData.of(context).locale,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        BlocArchitectureLocalizations.delegate,
        ...AppLocalizations.localizationsDelegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (BuildContext context, Widget? widget) {
        if (Config.enableErrorPage) {
          ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
            if (widget is Scaffold || widget is Navigator || widget is Router) {
              return AppErrorPage(errorDetails);
            }
            return AppErrorrWidget(errorDetails, widget: widget);
          };
        }

        if (widget == null) {
          throw FlutterError("Widget is null");
        }

        return widget;
      },
      routerConfig: goRouterConfig,
    );
  }

  /// Inital config, dependencies, bloc,...
  static Future<void> resolveDependencies() async {
    Bloc.observer = const AppBlocObserver(
      logOnBlocChange: Config.logOnBlocChange,
      logOnBlocCreate: Config.logOnBlocCreate,
      logOnBlocClose: Config.logOnBlocClose,
      logOnBlocError: Config.logOnBlocError,
      logOnBlocTransition: Config.logOnBlocTransition,
      logOnBlocEvent: Config.logOnBlocEvent,
    );

    await configureInjection(environment: Config.environment?.name);

    return getIt.allReady();
  }

  /// Copy FlutterNativeSplash optimize dependency
  static WidgetsBinding? _widgetsBinding;

  /// Pause app show splash only
  static void preserveSplash({required WidgetsBinding widgetsBinding}) {
    _widgetsBinding = widgetsBinding;
    _widgetsBinding?.deferFirstFrame();
  }

  /// Remove splash screen
  static void removeSplash() {
    _widgetsBinding?.allowFirstFrame();
    _widgetsBinding = null;
  }

  /// Check is show splash screen
  static bool get hasSplash => _widgetsBinding != null;
}

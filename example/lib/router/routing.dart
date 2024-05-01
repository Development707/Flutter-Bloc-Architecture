part of "router.dart";

/// Key for state for a [Navigator] widget.
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey();

/// Root A [Navigator] observer that notifies [RouteAware]s of changes to the state of their [Route].
final RouteObserver<ModalRoute<dynamic>> rootRouteObserver = RouteObserver<ModalRoute<dynamic>>();

/// Route config for `MaterialApp.router`
GoRouter goRouterConfig = GoRouter(
  debugLogDiagnostics: Config.enableNavigatorObserverLog,
  navigatorKey: rootNavigatorKey,
  observers: <NavigatorObserver>[rootRouteObserver],
  initialLocation: const AuthRoute().location,
  refreshListenable: GoRouterRefreshStream<AuthState>(getIt.get<AuthBloc>().stream),
  routes: $appRoutes,
  redirect: (BuildContext context, GoRouterState state) async {
    final bool isAuthPath = state.fullPath?.startsWith(const AuthRoute().location) ?? false;
    final bool isAuthenticated = getIt.get<AuthBloc>().state.isAuthenticated;

    if (!isAuthenticated && !isAuthPath) {
      return const AuthRoute().location;
    }
    if (isAuthenticated && isAuthPath) {
      return const HomeRoute().location;
    }

    if (App.hasSplash) {
      App.removeSplash();
    }

    return null;
  },
);

import "package:flutter/widgets.dart";
import "package:go_router/go_router.dart";

import "../core/config/config.dart";
import "../module/app/app.dart";
import "../module/auth/auth.dart";
import "../module/home/home.dart";
import "go_router_refresh_stream.dart";

part "router.g.dart";
part "routing.dart";

/// Redirect to [HomeRoute] for web
@TypedGoRoute<InitalRoute>(path: "/")
class InitalRoute extends GoRouteData {
  @override
  String? redirect(BuildContext context, GoRouterState state) => const HomeRoute().location;
}

/// [AuthRoute] for push, go, replace navigation
@TypedGoRoute<AuthRoute>(path: "/auth")
class AuthRoute extends GoRouteData {
  /// Creates an AuthRoute
  const AuthRoute();

  /// Config parent key for login screen
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginScreen();
}

/// [HomeRoute] for push, go, replace navigation
@TypedGoRoute<HomeRoute>(path: "/home")
class HomeRoute extends GoRouteData {
  /// Creates an HomeRoute
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

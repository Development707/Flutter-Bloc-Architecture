import "dart:async";

import "package:flutter/foundation.dart";

/// Convert Stream to Listenable
class GoRouterRefreshStream<T> extends ChangeNotifier {
  /// Create a GoRouterRefreshStream
  GoRouterRefreshStream(Stream<T> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((T _) => notifyListeners());
  }

  late final StreamSubscription<T> _subscription;

  @override
  Future<void> dispose() async {
    await _subscription.cancel();
    super.dispose();
  }
}

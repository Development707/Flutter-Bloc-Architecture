import "dart:async";

import "package:bloc_architecture_core/bloc_architecture_core.dart";
import "package:flutter/widgets.dart";

import "module/app/app.dart";

void main() async {
  await runZonedGuarded(() async {
    /// Show splash screen
    App.preserveSplash(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

    /// Inital App
    await App.resolveDependencies();
    runApp(const App());
  }, LogUtil.recordError);
}

import "package:bloc_architecture_core/bloc_architecture_core.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

/// Base error page, show this page if your page get error
class AppErrorPage extends StatelessWidget {
  /// Create an AppErrorPage
  const AppErrorPage(this.errorDetails, {super.key});

  /// Class for information provided to [FlutterExceptionHandler] callbacks.
  final FlutterErrorDetails errorDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.bug_report, size: 50),
          Text(_stringify(errorDetails.exception), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  static String _stringify(Object? exception) {
    try {
      return exception.toString();
    } on Object catch (_) {}
    return "Error";
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<FlutterErrorDetails>("errorDetails", errorDetails));
  }
}

/// Base error widget, show this widget if your widget go wrong
/// Something likes wrong image path, loading fail......
class AppErrorrWidget extends StatelessWidget {
  /// Create an AppErrorrWidget
  const AppErrorrWidget(this.errorDetails, {super.key, this.widget});

  /// Class for information provided to [FlutterExceptionHandler] callbacks.
  final FlutterErrorDetails errorDetails;

  /// Get name Widget error
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Placeholder(child: Icon(Icons.bug_report, color: context.colorScheme.error, size: 50));
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<FlutterErrorDetails>("errorDetails", errorDetails))
      ..add(DiagnosticsProperty<Widget?>("widget", widget));
  }
}

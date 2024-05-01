import "package:flutter/widgets.dart";

/// Config default value param for App
class AppParams {
  const AppParams._();

  /// Style curve
  static const Curve animationCurve = Curves.fastOutSlowIn;

  /// Default duration animation
  static const Duration animationDuration = Duration(milliseconds: 400);

  /// Default duration animation fast
  static const Duration animationDurationFast = Duration(milliseconds: 200);

  /// Default duration animation low
  static const Duration animationDurationLow = Duration(milliseconds: 800);

  /// Default duration text field input end
  static const Duration delayInputEnd = Duration(milliseconds: 1000);
}

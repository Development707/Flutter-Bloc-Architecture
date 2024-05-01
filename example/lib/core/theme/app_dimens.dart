import "package:flutter/widgets.dart";

/// Config default value dimens for Widget
class AppDimens {
  AppDimens._();

  /// Width of dialog (Px)
  static const double dialogWidth = 300;

  /// Gap of dialog (Px)
  static const double dialogGap = 16;

  /// Padding of dialog (Px)
  static const EdgeInsets dialogPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 24);

  /// Radius of dialog (Px)
  static const BorderRadius dialogRadius = BorderRadius.all(Radius.circular(10));

  /// Padding of card (Px)
  static const EdgeInsets cardPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 10);

  /// Gap of card (Px)
  static const double cardGap = 12;

  /// Normal size text (Px)
  static const double textSizeNormal = 16;

  /// Normal size space (Px)
  static const double marginNormal = 8;

  /// Normal radius button size (Px)
  static const double radiusNormal = 5;

  /// Distance of fab (Px)
  static const double fabDistance = 56;

  /// Padding of dropdown (Px)
  static const EdgeInsets dropdownPadding = EdgeInsets.symmetric(vertical: 24);

  /// Height of dropdown (Px)
  static const double dropdownHeight = 250;
}

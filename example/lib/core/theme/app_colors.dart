import "package:flutter/material.dart";

import "colors.gen.dart";

/// Custom color for app
class AppColors {
  /// Creates a light color
  const AppColors.light({
    this.primary = AssetColors.primary,
    this.secondary = AssetColors.secondary,
    this.tertiary = AssetColors.tertiary,
    this.error = AssetColors.error,
    this.background = AssetColors.white,
    this.foreground = AssetColors.black,
  });

  /// Creates a dark color
  factory AppColors.dark() {
    return const AppColors.light(
      background: AssetColors.black,
      foreground: AssetColors.white,
    );
  }

  /// The color displayed most frequently across your app’s screens and components.
  final Color primary;

  /// An accent color used for less prominent components in the UI, such as
  /// filter chips, while expanding the opportunity for color expression.
  final Color secondary;

  /// A color used as a contrasting accent that can balance [primary]
  /// and [secondary] colors or bring heightened attention to an element,
  /// such as an input field.
  final Color tertiary;

  /// The color to use for input validation errors, e.g. for
  final Color error;

  /// A color that typically appears behind scrollable content.
  final Color background;

  /// A color that's clearly legible when drawn on [background].
  final Color foreground;
}

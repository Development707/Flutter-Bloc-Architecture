import "package:flutter/material.dart";

import "fonts.gen.dart";

/// Config default value style for App
class AppStyles {
  const AppStyles._();

  /// Set scale factor don't change scale as device design
  ///
  /// Example iphone 11 has width 390
  static double? textScaleFactor(BuildContext context, {double maxTextScaleFactor = 1}) {
    final double width = MediaQuery.of(context).size.width;
    if (width > 390) {
      return null;
    }

    return (width / 390).clamp(0.1, maxTextScaleFactor);
  }

  /// FontSize 14, FontWeight 400, FontFamily inter
  static const TextStyle s14w400Inter = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: AppFonts.inter,
  );
}

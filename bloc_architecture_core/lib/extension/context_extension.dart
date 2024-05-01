// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:bloc_architecture_localization/bloc_architecture_localization.dart";
import "package:flutter/material.dart";

/// Common get value with BuildContext
extension ContextExtension on BuildContext {
  /// Callers can lookup localized strings with an instance of BlocArchitectureLocalizations
  BlocArchitectureLocalizations? get blocArchitecturel10n => BlocArchitectureLocalizations.of(this);

  /// A theme describes the colors and typographic choices of an application.
  ThemeData get theme => Theme.of(this);

  /// Returns [MediaQueryData.platformBrightness] for the nearest [MediaQuery] ancestor or [Brightness.light], if no such ancestor exists.
  Brightness get platformBrightness => MediaQuery.platformBrightnessOf(this);

  /// Manages [SnackBar]s and [MaterialBanner]s for descendant [Scaffold]s.
  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(this);

  /// Returns [MediaQueryData.size] from the nearest [MediaQuery] ancestor or throws an exception, if no such ancestor exists.
  Size get mediaQuerySize => MediaQuery.sizeOf(this);

  ///Returns [MediaQueryData.viewPadding] for the nearest [MediaQuery] ancestor or throws an exception, if no such ancestor exists.
  EdgeInsets get mediaQueryViewPadding => MediaQuery.viewPaddingOf(this);

  /// Returns [MediaQueryData.viewInsets] for the nearest [MediaQuery] ancestor or throws an exception, if no such ancestor exists.
  EdgeInsets get mediaQueryViewInsets => MediaQuery.viewInsetsOf(this);

  /// Returns [MediaQueryData.orientation] for the nearest [MediaQuery] ancestor or throws an exception, if no such ancestor exists.
  Orientation get mediaQueryOrientation => MediaQuery.orientationOf(this);

  /// similar to [Theme.of(context).colorScheme]
  ColorScheme get colorScheme => theme.colorScheme;

  /// similar to [Theme.of(context).textStyle]
  TextTheme get textTheme => theme.textTheme;

  /// get the shortestSide from screen
  double get mediaQueryShortestSide => mediaQuerySize.shortestSide;

  /// check if device is on landscape mode
  bool get isLandscape => mediaQueryOrientation == Orientation.landscape;

  /// check if device is on portrait mode
  bool get isPortrait => mediaQueryOrientation == Orientation.portrait;

  /// True if the shortestSide is smaller than 600p
  bool get isPhone => mediaQueryShortestSide < 600;

  /// True if the shortestSide is largest than 600p
  bool get isSmallTablet => mediaQueryShortestSide >= 600;

  /// True if the shortestSide is largest than 720p
  bool get isLargeTablet => mediaQueryShortestSide >= 720;

  /// True if the current device is Tablet
  bool get isTablet => isSmallTablet || isLargeTablet;

  /// Returns a specific value according to the screen size
  /// if the device width is higher than or equal to 1200 return
  /// [desktop] value. if the device width is higher than  or equal to 600
  /// and less than 1200 return [tablet] value.
  /// if the device width is less than 300  return [watch] value.
  /// in other cases return [mobile] value.
  T responsiveValue<T>({
    required T mobile,
    T? tablet,
    T? desktop,
    T? watch,
  }) {
    final double deviceWidth = mediaQueryShortestSide;

    if (deviceWidth >= 1200 && desktop != null) {
      return desktop;
    } else if (deviceWidth >= 600 && tablet != null) {
      return tablet;
    } else if (deviceWidth < 300 && watch != null) {
      return watch;
    } else {
      return mobile;
    }
  }
}

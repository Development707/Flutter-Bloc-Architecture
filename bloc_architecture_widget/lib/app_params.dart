// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:flutter/widgets.dart";

/// Config default value param for App
class AppParams {
  const AppParams._();

  /// Style curve
  static Curve animationCurve = Curves.fastOutSlowIn;

  /// Default duration animation
  static Duration animationDuration = const Duration(milliseconds: 400);

  /// Default duration animation fast
  static Duration animationDurationFast = const Duration(milliseconds: 200);

  /// Default duration animation low
  static Duration animationDurationLow = const Duration(milliseconds: 800);

  /// Default duration text field input end
  static Duration delayInputEnd = const Duration(milliseconds: 1000);
}

// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:flutter/material.dart";

import "../../../extension/extension.dart";

/// Common find class theme
mixin ThemeMixin<T extends StatefulWidget> on State<T> {
  /// App design
  late ThemeData theme;

  /// A set of 30 colors based on the Material spec that can be used to configure the color properties of most components.
  ColorScheme get colorScheme => theme.colorScheme;

  /// Material design text theme.
  TextTheme get textTheme => theme.textTheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    theme = context.theme;
  }

  @override
  void setState(void Function() fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}

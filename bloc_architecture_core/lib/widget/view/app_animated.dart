// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "../app_params.dart";

/// The type of animation to use.
enum AppAnimatedType {
  /// Fade animation
  fade,

  /// Rotate animation
  rotate,

  /// Scale animation
  scale,
}

/// [AppAnimated]
class AppAnimated extends StatelessWidget {
  /// Create new instance of [AppAnimated]
  const AppAnimated({
    super.key,
    this.duration = AppParams.animationDuration,
    this.curve = AppParams.animationCurve,
    this.type = AppAnimatedType.fade,
    this.child,
  });

  /// The duration of the animation.
  final Duration duration;

  /// The curve of the animation.
  final Curve curve;

  /// The type of animation to use.
  final AppAnimatedType type;

  /// The current child widget to display.
  ///
  /// The child is considered to be "new" if it has a different type or [Key] (see [Widget.canUpdate]).
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      reverseDuration: duration,
      switchInCurve: curve,
      switchOutCurve: curve,
      transitionBuilder: (Widget child, Animation<double> animation) => switch (type) {
        AppAnimatedType.fade => AnimatedSwitcher.defaultTransitionBuilder(child, animation),
        AppAnimatedType.rotate => RotationTransition(
            key: ValueKey<Key?>(child.key),
            turns: animation.drive(Tween<double>(begin: 0.5, end: 1)),
            child: child,
          ),
        AppAnimatedType.scale => ScaleTransition(
            key: ValueKey<Key?>(child.key),
            scale: animation.drive(Tween<double>(begin: 0.25, end: 1)),
            child: child,
          ),
      },
      layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) => switch (type) {
        AppAnimatedType.fade => AnimatedSwitcher.defaultLayoutBuilder(currentChild, previousChildren),
        AppAnimatedType.rotate || AppAnimatedType.scale => currentChild ?? const SizedBox.shrink(),
      },
      child: child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(EnumProperty<AppAnimatedType>("type", type))
      ..add(DiagnosticsProperty<Duration>("duration", duration))
      ..add(DiagnosticsProperty<Curve>("curve", curve));
  }
}

// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "dart:math" as math;

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "../app_dimens.dart";
import "../app_params.dart";

/// The type of behavior of this widget.
enum AppFabType {
  /// Show chirrent shape fan
  fan,

  /// Show chirrent shape up
  up,

  /// Show chirrent shape side
  side,
}

/// [AppFab] is a [FloatingActionButton] that can be expanded
///
/// Copy from: https://docs.flutter.dev/cookbook/effects/expandable-fab
@immutable
class AppFab extends StatefulWidget {
  /// Create an [AppFab] with required parameters
  const AppFab({
    required this.children,
    super.key,
    this.initialOpen = false,
    this.distance = AppDimens.fabDistance,
    this.child,
    this.backgroundColor,
    this.type = AppFabType.up,
  });

  /// Initial open state
  final bool initialOpen;

  /// The distance from the FAB when open
  final double distance;

  /// The children
  final List<Widget> children;

  /// The icon
  final Widget? child;

  /// The button's background color.
  final Color? backgroundColor;

  /// The type
  final AppFabType type;

  @override
  State<AppFab> createState() => _AppFabState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool?>("initialOpen", initialOpen))
      ..add(DoubleProperty("distance", distance))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(EnumProperty<AppFabType>("type", type));
  }
}

class _AppFabState extends State<AppFab> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: AppParams.animationDuration,
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: AppParams.animationCurve,
      reverseCurve: AppParams.animationCurve,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: <Widget>[
          _buildTapToCloseFab(),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return Container(
      width: 56,
      height: 56,
      alignment: Alignment.center,
      child: Material(
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).scaffoldBackgroundColor,
        shadowColor: Theme.of(context).shadowColor,
        elevation: 4,
        child: InkWell(
          onTap: _toggle,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(Icons.close, color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final List<Widget> children = <Widget>[];
    final int count = widget.children.length;

    for (int i = 0; i < count; i++) {
      final double direction;
      final double distance;

      switch (widget.type) {
        case AppFabType.fan:
          if (count > 1) {
            direction = 90 / (count - 1) * i;
          } else {
            direction = 90;
          }
          distance = widget.distance;
        case AppFabType.up:
          direction = 90;
          distance = widget.distance * (i + 1);

        case AppFabType.side:
          direction = 0;
          distance = widget.distance * (i + 1);
      }

      children.add(
        _ExpandingActionButton(
          directionInDegrees: direction,
          maxDistance: distance,
          progress: _expandAnimation,
          child: IgnorePointer(ignoring: !_open, child: widget.children[i]),
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1,
        ),
        duration: AppParams.animationDurationFast,
        curve: AppParams.animationCurve,
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          curve: AppParams.animationCurve,
          duration: AppParams.animationDurationFast,
          child: FloatingActionButton(
            onPressed: _toggle,
            backgroundColor: widget.backgroundColor,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  });

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (BuildContext context, Widget? child) {
        final Offset offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * maxDistance,
        );
        return Positioned(
          right: offset.dx,
          bottom: offset.dy,
          child: child!,
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty("directionInDegrees", directionInDegrees))
      ..add(DoubleProperty("maxDistance", maxDistance))
      ..add(DiagnosticsProperty<Animation<double>>("progress", progress));
  }
}

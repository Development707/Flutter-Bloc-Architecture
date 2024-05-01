// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "../app_dimens.dart";

/// [AppCard] design for App
class AppCard extends StatelessWidget {
  /// Create a [AppCard] design for App
  const AppCard({
    required this.content,
    super.key,
    this.leading,
    this.leadingGap = AppDimens.cardGap,
    this.trailing,
    this.trailingGap = AppDimens.cardGap,
    this.top,
    this.topGap = AppDimens.cardGap,
    this.bottom,
    this.bottomGap = AppDimens.cardGap,
    this.height,
    this.width,
    this.padding = AppDimens.cardPadding,
    this.margin,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.decoration,
  });

  /// Content
  final Widget content;

  /// Leading
  final Widget? leading;

  /// Trailing
  final Widget? trailing;

  /// Top
  final Widget? top;

  /// Bottom
  final Widget? bottom;

  /// Leading Gap
  final double leadingGap;

  /// Trailing Gap
  final double trailingGap;

  /// Top Gap
  final double topGap;

  /// Bottom Gap
  final double bottomGap;

  /// Height
  final double? height;

  /// Width
  final double? width;

  /// Padding
  final EdgeInsetsGeometry? padding;

  /// Margin
  final EdgeInsetsGeometry? margin;

  /// CrossAxis
  final CrossAxisAlignment crossAxisAlignment;

  /// MainAxis
  final MainAxisAlignment mainAxisAlignment;

  /// Decoration
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: <Widget>[
          if (top != null) ...<Widget>[
            top!,
            SizedBox(height: topGap),
          ],
          Row(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: <Widget>[
              if (leading != null) ...<Widget>[
                leading!,
                SizedBox(width: leadingGap),
              ],
              Expanded(child: content),
              if (trailing != null) ...<Widget>[
                SizedBox(width: trailingGap),
                trailing!,
              ],
            ],
          ),
          if (bottom != null) ...<Widget>[
            SizedBox(height: bottomGap),
            bottom!,
          ],
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty("leadingGap", leadingGap))
      ..add(DoubleProperty("trailingGap", trailingGap))
      ..add(DoubleProperty("bottomGap", bottomGap))
      ..add(DoubleProperty("height", height))
      ..add(DoubleProperty("width", width))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry?>("padding", padding))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry?>("margin", margin))
      ..add(EnumProperty<CrossAxisAlignment>("crossAxisAlignment", crossAxisAlignment))
      ..add(EnumProperty<MainAxisAlignment>("mainAxisAlignment", mainAxisAlignment))
      ..add(DiagnosticsProperty<Decoration?>("decoration", decoration))
      ..add(DoubleProperty("topGap", topGap));
  }
}

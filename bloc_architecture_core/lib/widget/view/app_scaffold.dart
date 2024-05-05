// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../../base/base.dart";

/// Scaffold design for App
class AppScaffold extends Scaffold {
  /// Creates an AppScaffold
  ///
  /// - hideKeyboardOnTap set `true` if you want to hide keyboard when tap on scaffold
  /// - disableGesturesOnLoad set `true` when use in [BasePageState]
  AppScaffold({
    super.key,
    super.appBar,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.floatingActionButtonAnimator,
    super.persistentFooterButtons,
    super.persistentFooterAlignment,
    super.drawer,
    super.onDrawerChanged,
    super.endDrawer,
    super.onEndDrawerChanged,
    super.bottomNavigationBar,
    super.bottomSheet,
    super.backgroundColor,
    super.resizeToAvoidBottomInset,
    super.primary,
    super.drawerDragStartBehavior,
    super.extendBody,
    super.extendBodyBehindAppBar,
    super.drawerScrimColor,
    super.drawerEdgeDragWidth,
    super.drawerEnableOpenDragGesture,
    super.endDrawerEnableOpenDragGesture,
    super.restorationId,
    this.hideKeyboardOnTap = true,
    Widget? body,
    bool disableGesturesOnLoad = false,
  }) : super(body: disableGesturesOnLoad ? _disableGestures(body) : body);

  /// Hide keyboard when tap on scaffold
  final bool hideKeyboardOnTap;

  @override
  ScaffoldState createState() => AppScaffoldState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>("hideKeyboardOnTap", hideKeyboardOnTap));
  }
}

/// Scaffold design for App
class AppScaffoldState extends ScaffoldState {
  @override
  AppScaffold get widget => super.widget as AppScaffold;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.hideKeyboardOnTap ? () => _hideKeyboard(context) : null,
      child: super.build(context),
    );
  }
}

void _hideKeyboard(BuildContext context) {
  final FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

Widget? _disableGestures(Widget? body) {
  if (body != null) {
    return BlocBuilder<StatusCubit, StatusState>(
      buildWhen: (StatusState previous, StatusState current) => previous.isLoading != current.isLoading,
      builder: (BuildContext context, StatusState state) => IgnorePointer(
        ignoring: state.isLoading,
        child: body,
      ),
    );
  }
  return null;
}

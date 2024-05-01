// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:flutter/material.dart";

/// Scaffold design for App
class AppScaffold extends Scaffold {
  /// Creates an AppScaffold
  const AppScaffold({
    super.key,
    super.appBar,
    super.drawer,
    super.endDrawer,
    super.body,
    super.floatingActionButton,
    super.bottomNavigationBar,
    super.backgroundColor,
  });

  @override
  ScaffoldState createState() => AppScaffoldState();
}

/// Scaffold design for App
class AppScaffoldState extends ScaffoldState {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _hideKeyboard(context),
      child: super.build(context),
    );
  }

  static void _hideKeyboard(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}

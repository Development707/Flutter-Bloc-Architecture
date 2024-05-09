// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:bloc_architecture_localization/bloc_architecture_localization.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

/// Dialog alert design for App
class AppAlertDialog extends StatelessWidget {
  /// Create an AppAlertDialog
  const AppAlertDialog({
    super.key,
    this.title,
    this.content,
    this.actions,
    this.useRootNavigator = true,
    this.closeOnTapOutside = true,
  });

  /// Create an AppAlertDialog return true if ok
  AppAlertDialog.ok({
    required BuildContext context,
    super.key,
    this.title,
    this.content,
    this.useRootNavigator = true,
    this.closeOnTapOutside = true,
  }) : actions = <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text(BlocArchitectureLocalizations.of(context)?.ok ?? "OK"),
            onPressed: () => Navigator.of(context, rootNavigator: useRootNavigator).pop(true),
          ),
        ];

  /// Create an AppAlertDialog return true if ok, false if cancel
  AppAlertDialog.cancelOrOk({
    required BuildContext context,
    super.key,
    this.title,
    this.content,
    this.useRootNavigator = true,
    this.closeOnTapOutside = true,
  }) : actions = <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: Text(BlocArchitectureLocalizations.of(context)?.cancel ?? "Cancel"),
            onPressed: () => Navigator.of(context, rootNavigator: useRootNavigator).pop(true),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text(BlocArchitectureLocalizations.of(context)?.ok ?? "OK"),
            onPressed: () => Navigator.of(context, rootNavigator: useRootNavigator).pop(false),
          ),
        ];

  /// Create an AppAlertDialog return true if yes, false if no
  AppAlertDialog.yesOrNo({
    required BuildContext context,
    super.key,
    this.title,
    this.content,
    this.useRootNavigator = true,
    this.closeOnTapOutside = true,
  }) : actions = <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: Text(BlocArchitectureLocalizations.of(context)?.yes ?? "Yes"),
            onPressed: () => Navigator.of(context, rootNavigator: useRootNavigator).pop(true),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text(BlocArchitectureLocalizations.of(context)?.no ?? "No"),
            onPressed: () => Navigator.of(context, rootNavigator: useRootNavigator).pop(false),
          ),
        ];

  /// Dialog title
  final Widget? title;

  /// Dialog content
  final Widget? content;

  /// Dialog actions
  final List<CupertinoDialogAction>? actions;

  /// Use root navigator
  final bool useRootNavigator;

  /// Close on tap outside
  final bool closeOnTapOutside;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AlertDialog.adaptive(
      title: title,
      content: content,
      actions: actions
          ?.map((CupertinoDialogAction e) => switch (theme.platform) {
                TargetPlatform.android ||
                TargetPlatform.fuchsia ||
                TargetPlatform.linux ||
                TargetPlatform.windows =>
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: e.isDestructiveAction ? theme.colorScheme.error : null,
                      textStyle: theme.textTheme.labelLarge
                          ?.merge(e.textStyle)
                          .copyWith(fontWeight: e.isDefaultAction ? FontWeight.bold : null),
                    ),
                    onPressed: e.onPressed,
                    child: e.child,
                  ),
                TargetPlatform.iOS || TargetPlatform.macOS => e,
              })
          .toList(),
    );
  }

  /// Displays a Material dialog above the current contents of the app
  Future<T?> show<T>(BuildContext context) => showAdaptiveDialog<T>(
        context: context,
        useRootNavigator: useRootNavigator,
        barrierDismissible: closeOnTapOutside,
        builder: (BuildContext context) => this,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>("useRootNavigator", useRootNavigator))
      ..add(DiagnosticsProperty<bool>("closeOnTapOutside", closeOnTapOutside));
  }
}

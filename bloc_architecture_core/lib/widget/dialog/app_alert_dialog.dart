// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

/// Dialog alert design for App
class AppAlertDialog extends StatelessWidget {
  /// Create an AppAlertDialog
  const AppAlertDialog({super.key, this.title, this.content, this.actions});

  /// Dialog title
  final Widget? title;

  /// Dialog content
  final Widget? content;

  /// Dialog actions
  final List<CupertinoDialogAction>? actions;

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
  Future<T?> show<T>(
    BuildContext context, {
    bool useRootNavigator = true,
    bool closeOnTapOutside = true,
  }) =>
      showAdaptiveDialog<T>(
        context: context,
        useRootNavigator: useRootNavigator,
        barrierDismissible: closeOnTapOutside,
        builder: (BuildContext context) => this,
      );
}

// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

/// Stepper design for App
class AppStepper extends StatelessWidget {
  /// Creates a stepper from a list of steps.
  const AppStepper({
    required this.controller,
    required this.steps,
    this.type = StepperType.vertical,
    super.key,
    this.doneTitle,
    this.onDone,
    this.onCancel,
    this.onUpdate,
  });

  /// The controller for this stepper
  final ValueNotifier<int> controller;

  /// The type of stepper that determines the layout.
  final StepperType type;

  /// The steps of the stepper whose titles, subtitles, icons always get shown.
  final List<Step> steps;

  /// The title of the done button
  final Widget? doneTitle;

  /// Called when the user tapped done
  final VoidCallback? onDone;

  /// Called when the user tapped cancel
  final VoidCallback? onCancel;

  /// Called when the user updates the stepper
  final bool Function(int previous, int current)? onUpdate;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<Step>("steps", steps))
      ..add(ObjectFlagProperty<VoidCallback?>.has("onDone", onDone))
      ..add(ObjectFlagProperty<VoidCallback?>.has("onCancel", onCancel))
      ..add(EnumProperty<StepperType>("type", type))
      ..add(DiagnosticsProperty<ValueNotifier<int>?>("controller", controller))
      ..add(DiagnosticsProperty<Widget?>("doneTitle", doneTitle))
      ..add(ObjectFlagProperty<bool Function(int previous, int current)?>.has("onUpdate", onUpdate));
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: controller,
      builder: (BuildContext context, int value, _) {
        return Stepper(
          currentStep: value,
          onStepTapped: (int index) {
            if (onUpdate?.call(controller.value, index) ?? true) {
              controller.value = index;
            }
          },
          onStepContinue: () {
            if (value == steps.length - 1) {
              onDone?.call();
            } else if (onUpdate?.call(controller.value, controller.value + 1) ?? true) {
              controller.value += 1;
            }
          },
          onStepCancel: () {
            if (value == 0) {
              onCancel?.call();
            } else if (onUpdate?.call(controller.value, controller.value - 1) ?? true) {
              controller.value -= 1;
            }
          },
          type: type,
          steps: steps,
          controlsBuilder: _controlsBuilder,
        );
      },
    );
  }

  Widget _controlsBuilder(BuildContext context, ControlsDetails details) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);

    const OutlinedBorder buttonShape = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2)));
    const EdgeInsets buttonPadding = EdgeInsets.symmetric(horizontal: 16);

    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 48),
        child: Row(
          children: <Widget>[
            FilledButton(
              onPressed: details.onStepContinue,
              style: FilledButton.styleFrom(padding: buttonPadding, shape: buttonShape),
              child: details.stepIndex == steps.length - 1
                  ? doneTitle ?? Text(localizations.okButtonLabel)
                  : Text(localizations.continueButtonLabel),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: details.onStepCancel,
              style: TextButton.styleFrom(
                foregroundColor: isDark ? Colors.white70 : Colors.black54,
                padding: buttonPadding,
                shape: buttonShape,
              ),
              child: Text(details.stepIndex == 0 ? localizations.cancelButtonLabel : localizations.backButtonTooltip),
            ),
          ],
        ),
      ),
    );
  }
}

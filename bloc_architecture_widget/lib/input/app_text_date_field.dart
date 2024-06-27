// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:bloc_architecture_core/bloc_architecture_core.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "app_text_form_field.dart";

/// Text field date with button
class AppTextDateField extends AppTextFormField {
  /// Create new instance of [AppTextDateField].
  @Deprecated("Is example use mixin `AppTextDateFieldHandle`")
  AppTextDateField({
    super.key,
    this.initialDate,
    this.minimumDate,
    this.maximumDate,
    this.onDateChanged,
    DateFormat? dateFormat,
    this.enablePickTime = false,
  }) : dateFormat = dateFormat ?? DateTimeFormatter.l10nDateFormat;

  /// Initial date
  final DateTime? initialDate;

  /// Minimum date default 1/1/1900
  final DateTime? minimumDate;

  /// Maximum date default now
  final DateTime? maximumDate;

  /// On date change
  final ValueChanged<DateTime>? onDateChanged;

  /// Date format
  final DateFormat dateFormat;

  /// Enable pick time
  final bool enablePickTime;

  @override
  State<AppTextDateField> createState() => _AppTextDateFieldState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<ValueChanged<DateTime>?>.has("onDateChanged", onDateChanged))
      ..add(DiagnosticsProperty<DateFormat>("dateFormat", dateFormat))
      ..add(DiagnosticsProperty<DateTime?>("initialDate", initialDate))
      ..add(DiagnosticsProperty<DateTime?>("minimumDate", minimumDate))
      ..add(DiagnosticsProperty<DateTime?>("maximumDate", maximumDate))
      ..add(DiagnosticsProperty<bool>("enablePickTime", enablePickTime));
  }
}

class _AppTextDateFieldState extends AppTextFormFieldState<AppTextDateField>
    with AppTextDateFieldHandle<AppTextDateField> {
  @override
  DateFormat get dateFormat => widget.dateFormat;

  @override
  bool get enablePickTime => widget.enablePickTime;

  @override
  DateTime? get initialDate => widget.initialDate;

  @override
  DateTime? get maximumDate => widget.maximumDate;

  @override
  DateTime? get minimumDate => widget.minimumDate;

  @override
  ValueChanged<DateTime>? get onDateChanged => widget.onDateChanged;

  @override
  Future<void> onTap() async {
    await showPicker();
  }
}

/// Handle input text date field
mixin AppTextDateFieldHandle<T extends StatefulWidget> on State<T> {
  final DateTime _now = DateTime.now();
  late DateTime _selected = initialDate ?? _now;

  /// A controller for an editable text field.
  TextEditingController get controller;

  /// An object that can be used by a stateful widget to obtain the keyboard focus and to handle keyboard events.
  FocusNode get focusNode;

  /// Initial date
  DateTime? get initialDate;

  /// Minimum date default 1/1/1900
  DateTime? get minimumDate;

  /// Maximum date default now
  DateTime? get maximumDate;

  /// On date change
  ValueChanged<DateTime>? get onDateChanged;

  /// Date format
  DateFormat get dateFormat;

  /// Enable pick time
  bool get enablePickTime;

  /// Action pick date
  Future<void> showPicker() async {
    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: _selected,
      firstDate: DateTime(1900),
      lastDate: maximumDate ?? _now,
    ).then((DateTime? value) async {
      if (value != null && enablePickTime) {
        final TimeOfDay? time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(value),
        );
        if (time != null) {
          return DateTime(value.year, value.month, value.day, time.hour, time.minute);
        }
      }
      return value;
    });

    _onDateTimeChange(dateTime);
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(_onFocusChange);
    if (initialDate != null) {
      controller.text = dateFormat.format(initialDate!);
    }
  }

  @override
  void dispose() {
    focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    if (!focusNode.hasFocus) {
      _onDateTimeChange(dateFormat.parse(controller.text));
    }
  }

  void _onDateTimeChange(DateTime? dateTime) {
    if (dateTime == null) {
      return;
    }

    _selected = dateTime;
    onDateChanged?.call(_selected);

    controller.text = dateFormat.format(_selected);
  }
}

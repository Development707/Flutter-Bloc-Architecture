// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "../../util/util.dart";
import "app_text_form_field.dart";

/// Text field date with button
class AppTextDateField extends AppTextFormField {
  /// Create new instance of [AppTextDateField].
  AppTextDateField({
    super.key,
    super.keyboardType = TextInputType.datetime,
    super.textInputAction = TextInputAction.done,
    super.validator,
    super.onSaved,
    super.readOnly = true,
    super.showCursor = false,
    super.enabled,
    super.hintText,
    super.prefixIcon = const Icon(Icons.calendar_month),
    super.prefixIconConstraints,
    super.textAlign,
    super.label,
    super.formFieldKey,
    super.controller,
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

class _AppTextDateFieldState extends AppTextFormFieldState<AppTextDateField> {
  final DateTime _now = DateTime.now();
  late DateTime _selected = widget.initialDate ?? _now;

  void onDateTimeChange(DateTime? dateTime) {
    if (dateTime == null) {
      return;
    }

    _selected = dateTime;
    widget.onDateChanged?.call(_selected);

    controller.text = widget.dateFormat.format(_selected);
  }

  @override
  void initState() {
    super.initState();
    if (widget.initialDate != null) {
      controller.text = widget.dateFormat.format(widget.initialDate!);
    }
  }

  @override
  void onFieldChange(String value) {
    super.onFieldChange(value);

    onDateTimeChange(DateTime.tryParse(value));
  }

  @override
  Future<void> onTap() async {
    if (!(widget.enabled ?? true)) {
      return;
    }

    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: _selected,
      firstDate: DateTime(1900),
      lastDate: widget.maximumDate ?? _now,
    ).then((DateTime? value) async {
      if (value != null && widget.enablePickTime) {
        final TimeOfDay? time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(value),
        );
        if (time != null) {
          return DateTime(value.year, value.month, value.day, time.hour, time.minute);
        }
      }
      return null;
    });

    onDateTimeChange(dateTime);
  }
}

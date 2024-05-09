// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:bloc_architecture_core/bloc_architecture_core.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "app_text_form_field.dart";

/// Text field date with button
class AppTextDateField extends AppTextFormField {
  /// Create new instance of [AppTextDateField].
  AppTextDateField({
    super.key,
    // Date
    super.keyboardType = TextInputType.datetime,
    super.textInputAction = TextInputAction.done,
    super.prefixIcon = const Icon(Icons.calendar_month),
    this.initialDate,
    this.minimumDate,
    this.maximumDate,
    this.onDateChanged,
    DateFormat? dateFormat,
    this.enablePickTime = false,
    // Form
    super.formFieldKey,
    super.restorationId,
    super.initialValue,
    super.validator,
    super.onSaved,
    super.onFieldSubmitted,
    // Text field
    super.controller,
    super.focusNode,
    super.textCapitalization,
    super.style,
    super.textAlign,
    super.textAlignVertical,
    super.textDirection,
    super.readOnly,
    super.showCursor,
    super.autofocus,
    super.autocorrect,
    super.obscureText,
    super.enableSuggestions,
    super.enabled,
    super.minLines,
    super.maxLength,
    super.onChanged,
    super.onEditingEnd,
    super.onFocusChange,
    super.onEditingCompleteValue,
    super.onEditingComplete,
    super.onTap,
    super.inputFormatters,
    // Decoration
    super.decoration,
    super.border,
    super.fillColor,
    super.prefix,
    super.suffix,
    super.label,
    super.hintText,
    super.errorText,
    super.suffixIcon,
    super.suffixIconConstraints,
    super.prefixIconConstraints,
    super.contentPadding,
    super.isDense,
    // Scroll
    super.expands,
    super.maxLines,
    super.scrollController,
    super.scrollPhysics,
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

    onDateTimeChange(widget.dateFormat.parse(value));
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
      return value;
    });

    onDateTimeChange(dateTime);
  }
}

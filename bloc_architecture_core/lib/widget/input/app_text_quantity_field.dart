// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:intl/number_symbols.dart";
import "package:intl/number_symbols_data.dart";

import "../../extension/extension.dart";
import "app_text_form_field.dart";

/// Text field quantity with button
class AppTextQuantityField<T extends num> extends AppTextFormField {
  /// Create new instance of [AppTextQuantityField]
  const AppTextQuantityField({
    super.key,
    super.textAlign = TextAlign.center,
    super.keyboardType = TextInputType.number,
    super.validator,
    super.onSaved,
    super.hintText,
    super.readOnly,
    super.fillColor,
    super.enabled,
    super.controller,
    super.inputFormatters,
    super.label,
    super.formFieldKey,
    this.initial,
    this.minimun,
    this.maximun,
    this.onQuantityChanged,
  });

  /// Initial quantity
  final T? initial;

  /// Minimun quantity
  final T? minimun;

  /// Maximun quantity
  final T? maximun;

  /// Callback when quantity changed
  final ValueChanged<T>? onQuantityChanged;

  @override
  State<AppTextQuantityField<T>> createState() => _AppTextQuantityFieldState<T>();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<T?>("initial", initial))
      ..add(DiagnosticsProperty<T?>("minimun", minimun))
      ..add(DiagnosticsProperty<T?>("maximun", maximun))
      ..add(ObjectFlagProperty<ValueChanged<T>?>.has("onQuantityChanged", onQuantityChanged));
  }
}

class _AppTextQuantityFieldState<T extends num> extends AppTextFormFieldState<AppTextQuantityField<T>> {
  @override
  void initState() {
    super.initState();
    controller.text = widget.initial?.toString() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton.outlined(onPressed: widget.enabled ?? true ? minus : null, icon: const Icon(Icons.remove)),
        Expanded(child: super.build(context)),
        IconButton.outlined(onPressed: widget.enabled ?? true ? plus : null, icon: const Icon(Icons.add)),
      ].applySeparator(const SizedBox(width: 8)),
    );
  }

  @override
  void onFocusChange() {
    super.onFocusChange();

    if (!focusNode.hasFocus) {
      onQuantityChanged();
    }
  }

  @override
  List<TextInputFormatter>? buildInputFormatters(BuildContext context) {
    return <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp("[0-9\\${getDecimalSep()}]")),
      ...?super.buildInputFormatters(context),
    ];
  }

  String getDecimalSep() {
    final Locale locale = Localizations.localeOf(context);
    final NumberSymbols? numberSymbols = numberFormatSymbols[locale.toString()] as NumberSymbols?;

    return numberSymbols?.DECIMAL_SEP ?? ".";
  }

  T getQuantity() {
    String text = controller.text;

    if (T == int) {
      return (int.tryParse(text.replaceAll(RegExp("[^0-9]"), "")) ?? 0) as T;
    } else if (T == double) {
      text = text.replaceAll(RegExp("[^0-9${getDecimalSep()}]"), "");
      text = text.replaceAll(getDecimalSep(), ".");

      return (double.tryParse(text) ?? 0.0) as T;
    }

    return 0 as T;
  }

  void onQuantityChanged([T? quantity]) {
    quantity ??= getQuantity();

    if (widget.minimun != null && quantity < widget.minimun!) {
      return;
    }
    if (widget.maximun != null && quantity > widget.maximun!) {
      return;
    }

    controller.text = quantity.toDecimal();

    widget.onQuantityChanged?.call(quantity);
  }

  void minus() {
    final T quantity = (getQuantity() - 1) as T;

    onQuantityChanged(quantity);
  }

  void plus() {
    final T quantity = (getQuantity() + 1) as T;

    onQuantityChanged(quantity);
  }
}

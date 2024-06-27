// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:bloc_architecture_core/bloc_architecture_core.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "app_text_form_field.dart";

/// Text field quantity with button
class AppTextQuantityField<T extends num> extends AppTextFormField {
  /// Create new instance of [AppTextQuantityField]
  @Deprecated("Is example use mixin `AppTextQuantityFieldHandle`")
  const AppTextQuantityField({
    super.key,
    // Quantity
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

class _AppTextQuantityFieldState<T extends num> extends AppTextFormFieldState<AppTextQuantityField<T>>
    with AppTextQuantityFieldHandle<T, AppTextQuantityField<T>> {
  @override
  T? get initial => widget.initial;

  @override
  T? get maximun => widget.maximun;

  @override
  T? get minimun => widget.minimun;

  @override
  ValueChanged<T>? get onQuantityChanged => widget.onQuantityChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton.outlined(onPressed: onMinus, icon: const Icon(Icons.remove)),
        Expanded(child: super.build(context)),
        IconButton.outlined(onPressed: onPlus, icon: const Icon(Icons.add)),
      ].applySeparator(const SizedBox(width: 8)),
    );
  }

  @override
  List<TextInputFormatter>? buildInputFormatters(BuildContext context) {
    return <TextInputFormatter>[
      textQuantityFormatter,
      ...?super.buildInputFormatters(context),
    ];
  }
}

/// Handle input text quantity field
mixin AppTextQuantityFieldHandle<T extends num, S extends StatefulWidget> on State<S> {
  /// A controller for an editable text field.
  TextEditingController get controller;

  /// An object that can be used by a stateful widget to obtain the keyboard focus and to handle keyboard events.
  FocusNode get focusNode;

  /// Initial quantity
  T? get initial;

  /// Minimun quantity
  T? get minimun;

  /// Maximun quantity
  T? get maximun;

  /// Callback when quantity changed
  ValueChanged<T>? get onQuantityChanged;

  /// Quantity formatter
  TextInputFormatter get textQuantityFormatter =>
      FilteringTextInputFormatter.allow(RegExp("[0-9\\${_getDecimalSep()}-]"));

  /// Action when minus button pressed
  void onMinus() {
    final T quantity = (_getQuantity() - 1) as T;

    _onQuantityChanged(quantity);
  }

  /// Action when plus button pressed
  void onPlus() {
    final T quantity = (_getQuantity() + 1) as T;

    _onQuantityChanged(quantity);
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(_onFocusChange);
    controller.text = initial?.toDecimal() ?? "";
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.removeListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (!focusNode.hasFocus) {
      _onQuantityChanged();
    }
  }

  String _getDecimalSep() {
    final Locale locale = Localizations.localeOf(context);
    final NumberSymbols? numberSymbols = numberFormatSymbols[locale.toString()] as NumberSymbols?;

    return numberSymbols?.DECIMAL_SEP ?? ".";
  }

  T _getQuantity() {
    String text = controller.text;

    if (T == int) {
      return (int.tryParse(text.replaceAll(RegExp("[^0-9-]"), "")) ?? 0) as T;
    } else if (T == double) {
      text = text.replaceAll(RegExp("[^0-9${_getDecimalSep()}-]"), "");
      text = text.replaceAll(_getDecimalSep(), ".");

      return (double.tryParse(text) ?? 0.0) as T;
    }

    return 0 as T;
  }

  void _onQuantityChanged([T? newQuantity]) {
    T? quantity = newQuantity ?? _getQuantity();

    final T? minimun = this.minimun;
    if (minimun != null && quantity < minimun) {
      quantity = minimun;
    }
    final T? maximun = this.maximun;
    if (maximun != null && quantity > maximun) {
      quantity = maximun;
    }

    controller.text = quantity.toDecimal();

    onQuantityChanged?.call(quantity);
  }
}

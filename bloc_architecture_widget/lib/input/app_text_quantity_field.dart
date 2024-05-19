// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:bloc_architecture_core/bloc_architecture_core.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:intl/number_symbols.dart";
import "package:intl/number_symbols_data.dart";

import "app_text_form_field.dart";

/// Text field quantity with button
class AppTextQuantityField<T extends num> extends AppTextFormField {
  /// Create new instance of [AppTextQuantityField]
  const AppTextQuantityField({
    super.key,
    // Quantity
    super.textAlign = TextAlign.center,
    super.keyboardType = TextInputType.number,
    this.initial,
    this.minimun,
    this.maximun,
    this.onQuantityChanged,
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
    super.textInputAction,
    super.textCapitalization,
    super.style,
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
    super.prefixIcon,
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
    controller.text = widget.initial?.toDecimal() ?? "";
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
      FilteringTextInputFormatter.allow(RegExp("[0-9\\${getDecimalSep()}-]")),
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
      return (int.tryParse(text.replaceAll(RegExp("[^0-9-]"), "")) ?? 0) as T;
    } else if (T == double) {
      text = text.replaceAll(RegExp("[^0-9${getDecimalSep()}-]"), "");
      text = text.replaceAll(getDecimalSep(), ".");

      return (double.tryParse(text) ?? 0.0) as T;
    }

    return 0 as T;
  }

  void onQuantityChanged([T? newQuantity]) {
    T? quantity = newQuantity ?? getQuantity();

    final T? minimun = widget.minimun;
    if (minimun != null && quantity < minimun) {
      quantity = minimun;
    }
    final T? maximun = widget.maximun;
    if (maximun != null && quantity > maximun) {
      quantity = maximun;
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

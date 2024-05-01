// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "app_text_form_field.dart";

/// Handle form input text field
class AppTextPasswordField extends AppTextFormField {
  /// Handle form input text field
  const AppTextPasswordField({
    super.key,
    this.suffixIconSize = 20,
    // Form
    super.formFieldKey,
    super.initialValue,
    super.validator,
    super.onSaved,
    super.onFieldSubmitted,
    // Handler
    super.controller,
    super.focusNode,
    super.onChanged,
    super.onEditingEnd,
    // Decoration
    super.keyboardType = TextInputType.visiblePassword,
    super.textInputAction = TextInputAction.done,
    super.textCapitalization = TextCapitalization.none,
    super.label,
    super.contentPadding,
    super.hintText,
    super.obscureText = true,
  });

  /// Icon eye size
  final double suffixIconSize;

  @override
  State<AppTextPasswordField> createState() => _AppTextFormPasswordFieldState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty("suffixIconSize", suffixIconSize));
  }
}

class _AppTextFormPasswordFieldState extends AppTextFormFieldState<AppTextPasswordField> {
  @override
  late bool obscureText = widget.obscureText;

  @override
  void onFieldChange(String value) {
    super.onFieldChange(value);
    if (!obscureText) {
      setState(() => obscureText = !obscureText);
    }
  }

  Widget get suffixIcon {
    return IconButton(
      iconSize: widget.suffixIconSize,
      visualDensity: const VisualDensity(vertical: -4),
      icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
      onPressed: () => setState(() => obscureText = !obscureText),
    );
  }

  @override
  InputDecoration buildDecoration(BuildContext context) {
    return super.buildDecoration(context).copyWith(suffixIcon: suffixIcon);
  }
}

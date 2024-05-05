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
    // Password
    this.suffixIconSize = 20,
    super.keyboardType = TextInputType.visiblePassword,
    super.textInputAction = TextInputAction.done,
    super.textCapitalization = TextCapitalization.none,
    super.obscureText = true,
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
    super.style,
    super.textAlign,
    super.textAlignVertical,
    super.textDirection,
    super.readOnly,
    super.showCursor,
    super.autofocus,
    super.autocorrect,
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
    return super.buildDecoration(context).copyWith(suffixIcon: widget.suffixIcon ?? suffixIcon);
  }
}

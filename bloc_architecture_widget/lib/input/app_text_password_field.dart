// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:flutter/material.dart";

import "app_text_form_field.dart";

/// Handle form input text field
class AppTextPasswordField extends AppTextFormField {
  /// Handle form input text field
  @Deprecated("Is example use mixin `AppTextPasswordFieldHandle`")
  const AppTextPasswordField({super.key});

  @override
  State<AppTextPasswordField> createState() => _AppTextFormPasswordFieldState();
}

class _AppTextFormPasswordFieldState extends AppTextFormFieldState<AppTextPasswordField>
    with AppTextPasswordFieldHandle<AppTextPasswordField> {
  @override
  bool obscureText = true;

  @override
  InputDecoration buildDecoration(BuildContext context) {
    return super.buildDecoration(context).copyWith(suffixIcon: suffixIcon);
  }
}

/// Handle input text pawword field
mixin AppTextPasswordFieldHandle<T extends StatefulWidget> on State<T> {
  /// Getter and setter obscure text
  bool get obscureText;
  set obscureText(bool value);

  /// Suffix icon
  Widget get suffixIcon {
    return IconButton(
      visualDensity: const VisualDensity(vertical: -4),
      icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
      onPressed: () => setState(() => obscureText = !obscureText),
    );
  }
}

// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "app_text_form_field.dart";

/// Text field search with button search
class AppTextSearchField extends AppTextFormField {
  /// Create an AppTextSearchField
  const AppTextSearchField(
      {super.key,
      super.onFieldSubmitted,
      super.hintText,
      this.hintStyle,
      super.suffixIcon,
      super.suffixIconConstraints,
      super.onEditingEnd,
      super.onChanged,
      super.label});

  /// The style to use for the [hintText].
  final TextStyle? hintStyle;

  @override
  State<AppTextSearchField> createState() => _AppTextSearchFieldState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TextStyle?>("hintStyle", hintStyle));
  }
}

class _AppTextSearchFieldState extends AppTextFormFieldState<AppTextSearchField> {
  @override
  void onFieldChange(String value) {
    super.onFieldChange(value);
    setState(() {});
  }

  @override
  InputDecoration buildDecoration(BuildContext context) {
    return super.buildDecoration(context).copyWith(
        suffixIcon: IconButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                controller.text = "";
                onFieldChange("");
              }
            },
            icon: Icon(controller.text.isNotEmpty ? Icons.highlight_remove_outlined : Icons.search_outlined)));
  }
}

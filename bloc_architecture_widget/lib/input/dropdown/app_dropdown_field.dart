// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "dart:async";

import "package:bloc_architecture_core/bloc_architecture_core.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "../../app_dimens.dart";
import "../app_text_form_field.dart";

/// A dropdown menu that can be opened from a [TextField].
class AppDropdownField<T> extends AppTextFormField {
  /// Create instance of [AppDropdownField].
  @Deprecated("Is example use mixin `AppDropdownFieldHandle`")
  const AppDropdownField({
    // Dropdown
    required this.dropdownMenuEntries,
    this.initialSelection,
    this.onSelected,
    this.buildLabel,
    this.buildLabelWidget,
    this.buildLeadingIcon,
    this.buildTrailingIcon,
    this.helperText,
    this.selectedTrailingIcon,
    this.enableFilter = false,
    this.enableSearch = true,
    super.key,
    // Form
    super.formFieldKey,
    super.restorationId,
    super.initialValue,
    super.validator, // Issue open: https://github.com/flutter/flutter/issues/141941
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

  /// DropdownMenu: selected trailing icon
  final Widget? selectedTrailingIcon;

  /// DropdownMenu: helper text
  final String? helperText;

  /// DropdownMenu: enable filter
  final bool enableFilter;

  /// DropdownMenu: enable search
  final bool enableSearch;

  /// The value used to for an initial selection.
  final T? initialSelection;

  /// Descriptions of the menu items.
  final List<T> dropdownMenuEntries;

  /// The callback is called when a selection is made.
  final ValueChanged<T?>? onSelected;

  /// Build label default is [toString]
  final String Function(T value, BuildContext context)? buildLabel;

  /// Build label widget
  final Widget Function(T value)? buildLabelWidget;

  /// Build leading icon
  final Widget Function(T value)? buildLeadingIcon;

  /// Build trailing icon
  final Widget Function(T value)? buildTrailingIcon;

  @override
  State<AppTextFormField> createState() => AppDropdownFieldState<T, AppDropdownField<T>>();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<T?>("initialSelection", initialSelection))
      ..add(IterableProperty<T>("dropdownMenuEntries", dropdownMenuEntries))
      ..add(ObjectFlagProperty<ValueChanged<T?>?>.has("onSelected", onSelected))
      ..add(ObjectFlagProperty<Widget Function(T value)?>.has("buildLabelWidget", buildLabelWidget))
      ..add(ObjectFlagProperty<Widget Function(T value)?>.has("buildLeadingIcon", buildLeadingIcon))
      ..add(ObjectFlagProperty<Widget Function(T value)?>.has("buildTrailingIcon", buildTrailingIcon))
      ..add(ObjectFlagProperty<String Function(T value, BuildContext context)?>.has("buildLabel", buildLabel))
      ..add(StringProperty("helperText", helperText))
      ..add(DiagnosticsProperty<bool>("enableFilter", enableFilter))
      ..add(DiagnosticsProperty<bool>("enableSearch", enableSearch));
  }
}

/// State of [AppDropdownField].
class AppDropdownFieldState<T, W extends AppDropdownField<T>> extends AppTextFormFieldState<W> {
  /// The value used to for an initial selection.
  T? get initialSelection => widget.initialSelection;

  /// Descriptions of the menu items in the [DropdownMenu].
  List<DropdownMenuEntry<T>> get dropdownMenuEntries => widget.dropdownMenuEntries
      .map((T e) => DropdownMenuEntry<T>(
            value: e,
            label: widget.buildLabel?.call(e, context) ?? e.toString(),
            labelWidget: widget.buildLabelWidget?.call(e),
            leadingIcon: widget.buildLeadingIcon?.call(e),
            trailingIcon: widget.buildTrailingIcon?.call(e),
          ))
      .toList();

  /// The callback is called when a selection is made.
  void onSelected(T? value) => widget.onSelected?.call(value);

  @override
  Widget build(BuildContext context) {
    final InputDecoration inputDecoration = buildDecoration(context);

    return DropdownMenu<T>(
      expandedInsets: AppDimens.dropdownPadding,
      menuHeight: AppDimens.dropdownHeight,
      trailingIcon: trailingIcon,
      selectedTrailingIcon: selectedTrailingIcon,
      initialSelection: initialSelection,
      dropdownMenuEntries: dropdownMenuEntries,
      controller: controller,
      onSelected: onSelected,

      /// TextField
      enabled: widget.enabled ?? true,
      leadingIcon: widget.prefixIcon,
      label: widget.label,
      hintText: widget.hintText,
      errorText: widget.errorText,
      textStyle: widget.style,
      helperText: widget.helperText,
      enableFilter: widget.enableFilter,
      enableSearch: widget.enableSearch,

      /// Convert [InputDecoration] to [InputDecorationTheme]
      inputDecorationTheme: context.theme.inputDecorationTheme.copyWith(
        labelStyle: inputDecoration.labelStyle,
        floatingLabelStyle: inputDecoration.floatingLabelStyle,
        helperStyle: inputDecoration.helperStyle,
        helperMaxLines: inputDecoration.helperMaxLines,
        hintStyle: inputDecoration.hintStyle,
        hintFadeDuration: inputDecoration.hintFadeDuration,
        errorStyle: inputDecoration.errorStyle,
        errorMaxLines: inputDecoration.errorMaxLines,
        floatingLabelBehavior: inputDecoration.floatingLabelBehavior,
        isDense: inputDecoration.isDense,
        contentPadding: inputDecoration.contentPadding,
        isCollapsed: inputDecoration.isCollapsed,
        iconColor: inputDecoration.iconColor,
        prefixStyle: inputDecoration.prefixStyle,
        prefixIconColor: inputDecoration.prefixIconColor,
        suffixStyle: inputDecoration.suffixStyle,
        suffixIconColor: inputDecoration.suffixIconColor,
        counterStyle: inputDecoration.counterStyle,
        filled: inputDecoration.filled,
        fillColor: inputDecoration.fillColor,
        activeIndicatorBorder:
            (inputDecoration is UnderlineInputBorder) ? (inputDecoration as UnderlineInputBorder).borderSide : null,
        outlineBorder:
            (inputDecoration is OutlineInputBorder) ? (inputDecoration as OutlineInputBorder).borderSide : null,
        focusedBorder: inputDecoration.focusedBorder,
        focusedErrorBorder: inputDecoration.focusedErrorBorder,
        disabledBorder: inputDecoration.disabledBorder,
        enabledBorder: inputDecoration.enabledBorder,
        border: inputDecoration.border,
        alignLabelWithHint: inputDecoration.alignLabelWithHint,
        constraints: const BoxConstraints.tightFor(height: 46),
      ),
    );
  }

  /// Build leading icon
  @protected
  Widget? get trailingIcon => widget.suffixIcon;

  /// Build trailing icon
  @protected
  Widget? get selectedTrailingIcon => widget.selectedTrailingIcon;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<DropdownMenuEntry<T>>("dropdownMenuEntries", dropdownMenuEntries))
      ..add(DiagnosticsProperty<T?>("initialSelection", initialSelection));
  }
}

/// Handle status with form
mixin AppDropdownFieldStateForm<T, W extends AppDropdownField<T>> on AppDropdownFieldState<T, W> {
  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      key: formFieldKey,
      initialValue: widget.initialValue,
      validator: widget.validator,
      enabled: widget.enabled ?? true,
      autovalidateMode: AutovalidateMode.disabled,
      restorationId: widget.restorationId,
      onSaved: widget.onSaved,
      builder: (FormFieldState<String> field) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            super.build(context),
            if (field.hasError || widget.errorText != null)
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 4, start: 4),
                child: Text(
                  widget.errorText ?? field.errorText ?? "",
                  style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.error),
                ),
              ),
          ],
        );
      },
    );
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    final T? initialSelection = widget.initialSelection;
    if (initialSelection != null) {
      WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
        final String value = widget.buildLabel?.call(initialSelection, context) ?? initialSelection.toString();
        fieldState?.didChange(value);
      });
    }
  }
}

/// Handle status with cubit
mixin AppDropdownFieldStateAsynchronous<T, W extends AppDropdownField<T>> on AppDropdownFieldState<T, W> {
  @override
  List<DropdownMenuEntry<T>> dropdownMenuEntries = <DropdownMenuEntry<T>>[];

  /// Cubit handle status
  final StatusCubit cubit = StatusCubit();

  @override
  void initState() {
    super.initState();
    unawaited(loadMenuEntries());
  }

  @override
  void dispose() {
    unawaited(cubit.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatusCubit, StatusState>(
      bloc: cubit,
      buildWhen: (StatusState previous, StatusState current) => current != previous,
      builder: (BuildContext context, StatusState state) {
        return super.build(context);
      },
    );
  }

  @override
  Widget? get trailingIcon {
    if (cubit.state.isError) {
      return const Icon(Icons.error);
    } else if (cubit.state.isLoading) {
      return SizedBox.square(
        dimension: 24,
        child: CircularProgressIndicator(value: cubit.state.progress),
      );
    }
    return widget.suffixIcon;
  }

  /// Load menu entries when the widget is created
  Future<void> loadMenuEntries() => cubit.runCubitCatching(
        action: getMenuEntries,
        doOnSuccess: (List<DropdownMenuEntry<T>> value) => dropdownMenuEntries = value,
      );

  /// Get menu entries from api, database, etc.
  Future<List<DropdownMenuEntry<T>>> getMenuEntries();
}

// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "dart:async";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../../../base/base.dart";
import "../../../extension/context_extension.dart";
import "../../app_dimens.dart";
import "../app_text_form_field.dart";

/// A dropdown menu that can be opened from a [TextField].
class AppDropdownField<T> extends AppTextFormField {
  /// Create instance of [AppDropdownField].
  const AppDropdownField({
    required this.dropdownMenuEntries,
    super.key,
    super.enabled,
    super.style,
    super.label,
    super.hintText,
    super.prefixIcon,
    super.suffixIcon,
    super.fillColor,
    super.onFieldSubmitted,
    super.controller,
    super.formFieldKey,
    super.validator, // Issue open: https://github.com/flutter/flutter/issues/141941
    this.initialSelection,
    this.onSelected,
    this.buildLabel,
    this.buildLabelWidget,
    this.buildLeadingIcon,
    this.buildTrailingIcon,
  });

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
      ..add(ObjectFlagProperty<String Function(T value, BuildContext context)?>.has("buildLabel", buildLabel));
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
    return DropdownMenu<T>(
      expandedInsets: AppDimens.dropdownPadding,
      menuHeight: AppDimens.dropdownHeight,
      enabled: widget.enabled ?? true,
      textStyle: widget.style,
      label: widget.label,
      hintText: widget.hintText,
      leadingIcon: widget.prefixIcon,
      trailingIcon: trailingIcon,
      inputDecorationTheme: context.theme.inputDecorationTheme.copyWith(
        border: widget.border,
        isDense: widget.isDense,
        contentPadding: widget.contentPadding,
        filled: true,
        fillColor: widget.fillColor ?? Theme.of(context).scaffoldBackgroundColor,
        labelStyle: widget.style,
        hintStyle: widget.style,
        constraints: const BoxConstraints.tightFor(height: 46),
      ),
      initialSelection: initialSelection,
      dropdownMenuEntries: dropdownMenuEntries,
      controller: controller,
      onSelected: onSelected,
    );
  }

  /// Build leading icon
  @protected
  Widget? get trailingIcon => widget.suffixIcon;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<DropdownMenuEntry<T>>("dropdownMenuEntries", dropdownMenuEntries))
      ..add(DiagnosticsProperty<T?>("initialSelection", initialSelection));
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
  Widget? get trailingIcon => cubit.state.maybeWhen(
        loading: (double? progress) => Center(child: CircularProgressIndicator(value: progress)),
        error: (_) => const Icon(Icons.error),
        orElse: () => widget.suffixIcon,
      );

  /// Load menu entries when the widget is created
  Future<void> loadMenuEntries() => cubit.runCubitCatching(
        action: getMenuEntries,
        doOnSuccess: (List<DropdownMenuEntry<T>> value) => dropdownMenuEntries = value,
      );

  /// Get menu entries from api, database, etc.
  Future<List<DropdownMenuEntry<T>>> getMenuEntries();
}

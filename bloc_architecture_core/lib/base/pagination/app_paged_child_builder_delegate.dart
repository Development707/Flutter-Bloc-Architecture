// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:bloc_architecture_localization/bloc_architecture_localization.dart";
import "package:flutter/material.dart";
import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";

import "../../extension/extension.dart";

/// Supplies builders for the visual components of paged views.
class AppPagedChildBuilderDelegate<T> extends PagedChildBuilderDelegate<T> {
  /// Creates a PagedChildBuilderDelegate.
  AppPagedChildBuilderDelegate({
    required super.itemBuilder,

    /// Error
    super.firstPageErrorIndicatorBuilder = _pageErrorIndicator,
    super.newPageErrorIndicatorBuilder = _pageErrorIndicator,

    /// Progress
    super.firstPageProgressIndicatorBuilder = _pageProgressIndicator,
    super.newPageProgressIndicatorBuilder = _pageProgressIndicator,

    /// Other
    super.animateTransitions = true,
    super.noItemsFoundIndicatorBuilder = _pageNoItemsFoundIndicator,
    super.noMoreItemsIndicatorBuilder,
  });
}

Widget _pageErrorIndicator(BuildContext context) {
  final ColorScheme colors = context.colorScheme;
  final BlocArchitectureLocalizations? l10n = context.blocArchitecturel10n;

  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(Icons.refresh, color: colors.onBackground),
        Text(l10n?.somethingWentWrong ?? "Something went wrong", style: context.textTheme.bodySmall),
        const SizedBox(height: 8),
      ],
    ),
  );
}

Widget _pageProgressIndicator(BuildContext context) {
  return const Center(child: CircularProgressIndicator());
}

Widget _pageNoItemsFoundIndicator(BuildContext context) {
  final ColorScheme colors = context.colorScheme;
  final BlocArchitectureLocalizations? l10n = context.blocArchitecturel10n;

  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(Icons.search, color: colors.onBackground),
        Text(l10n?.noItemsFound ?? "No items found", style: context.textTheme.bodySmall),
        const SizedBox(height: 8),
      ],
    ),
  );
}

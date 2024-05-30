// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";

import "base_pagination.dart";

/// A controller for a paged widget.
///
/// If you modify the [itemList], [error] or [nextPageKey] properties, the paged widget will be notified and will update itself appropriately.
class BasePagingController<T, P extends BasePagination<T>> extends PagingController<int, T> {
  /// Creates an BasePagingController
  BasePagingController({
    super.firstPageKey = 0,
    super.invisibleItemsThreshold = 5,
  });

  /// Call when page scroll to end
  Future<void> fetchPage(Future<P> onLoadMore) async {
    try {
      final P pagination = await onLoadMore;

      onSuccess(pagination);
    } on Object catch (e) {
      onError(e);
    }
  }

  /// call [trigger] when initState
  void trigger({PageRequestListener<int>? onLoadMore, PagingStatusListener? onStatusChange}) {
    if (onLoadMore != null) {
      addPageRequestListener(onLoadMore.call);
    }

    if (onStatusChange != null) {
      addStatusListener(onStatusChange.call);
    }
  }

  /// call [onSuccess] when success
  void onSuccess(P pagination) {
    if (pagination.isLast) {
      appendLastPage(pagination.data);
    } else {
      appendPage(pagination.data, pagination.nextPageNumber);
    }
  }

  /// call [onError] when error
  void onError(final Object exception) {
    if (exception is Error || exception is Exception) {
      error = exception;
    }
  }

  /// call [onError] when error
  Future<void> onRefresh() async => refresh();
}

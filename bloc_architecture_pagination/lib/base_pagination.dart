// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

/// Model data for Pagination
abstract class BasePagination<T> {
  /// Creates a mode BasePagination
  const BasePagination();

  /// Get data
  List<T> get data;

  /// Number of next page
  int get nextPageNumber;

  /// Number of previous page
  int get previousPageNumber;

  /// Check is first page
  bool get isFirst;

  /// Check is last page
  bool get isLast;
}

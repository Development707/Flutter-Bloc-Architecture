import "package:bloc_architecture_pagination/bloc_architecture_pagination.dart";

import "../../data/model/model.dart";

/// Model data for Pagination
mixin AppPagination<T> on AppResponse<T> implements BasePagination<T> {
  @override
  List<T> get data => whenOrNull(page: (List<T> data, _, __, ___) => data) ?? List<T>.empty();

  /// Number of next page
  @override
  int get nextPageNumber => (pageNumber ?? 0) + 1;

  /// Number of previous page
  @override
  int get previousPageNumber => isFirst ? 0 : (pageNumber ?? 0) - 1;

  /// Check is first page
  @override
  bool get isFirst => (pageNumber ?? 0) == 0;

  /// Check is last page
  @override
  bool get isLast => ((pageNumber ?? 0) * (pageSize ?? 0)) >= (totalElements ?? 0);
}

/// Controller for a paged widget.
class AppPagingController<T> extends BasePagingController<T, AppPagination<T>> {}

/// AppPagedChildBuilderDelegate
class AppPagedChildBuilderDelegate<T> extends BasePagedChildBuilderDelegate<T> {
  /// Create a AppPagedChildBuilderDelegate
  AppPagedChildBuilderDelegate({required super.itemBuilder});
}

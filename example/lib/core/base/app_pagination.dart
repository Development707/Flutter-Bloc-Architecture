import "package:bloc_architecture_pagination/bloc_architecture_pagination.dart" as pagination;
import "package:freezed_annotation/freezed_annotation.dart";

part "app_pagination.freezed.dart";

/// Model data for Pagination
@freezed
class AppPagination<T> with _$AppPagination<T> implements pagination.AppPagination<T> {
  /// Creates a mode AppPagination
  const factory AppPagination({
    required List<T> data,
    required int pageNumber,
    @Default(20) int pageSize,
    @Default(0) int totalElements,
  }) = _AppPagination<T>;

  const AppPagination._();

  /// Number of next page
  @override
  int get nextPageNumber => pageNumber + 1;

  /// Number of previous page
  @override
  int get previousPageNumber => isFirst ? 0 : pageNumber - 1;

  /// Check is first page
  @override
  bool get isFirst => pageNumber == 0;

  /// Check is last page
  @override
  bool get isLast => (pageNumber * pageSize) >= totalElements;
}

/// Controller for a paged widget.
class AppPagingController<T> extends pagination.AppPagingController<T, AppPagination<T>> {}

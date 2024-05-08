part of "pagination_bloc.dart";

/// Event for [PaginationBloc]
@freezed
class PaginationEvent with _$PaginationEvent {
  /// Event started
  const factory PaginationEvent.loadPage(int pageNumber) = _LoadPage;
}

import "package:bloc_architecture_core/base/base.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:injectable/injectable.dart";

import "../../../core/base/base.dart";
import "../../../data/model/model.dart";

part "pagination_event.dart";
part "pagination_state.dart";
part "pagination_bloc.freezed.dart";

/// [PaginationBloc] is using to manage states and events of pagination
@injectable
class PaginationBloc extends BaseBloc<PaginationEvent, PaginationState> {
  /// Create instance of [PaginationBloc]
  PaginationBloc() : super(const PaginationState()) {
    on<_LoadPage>(_onLoadPage);
    pagingController.trigger(onLoadMore: (int pageNumber) => add(PaginationEvent.loadPage(pageNumber)));
  }

  Future<void> _onLoadPage(_LoadPage event, Emitter<PaginationState> emit) => runBlocCatching(
        action: () => Future<List<String>>.delayed(
          const Duration(seconds: 1),
          () => List<String>.generate(
            10,
            (int index) => "Item ${index * (event.pageNumber)}",
          ),
        ),
        autoHandleStatus: false,
        doOnSuccess: (List<String> value) => pagingController.onSuccess(
          AppResponsePage<String>(value, event.pageNumber, 10, 100),
        ),
        doOnError: pagingController.onError,
      );

  /// Initialize pagination
  final AppPagingController<String> pagingController = AppPagingController<String>();
}

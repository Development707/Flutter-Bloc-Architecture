import "package:bloc_architecture_core/bloc_architecture_core.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:injectable/injectable.dart";

import "../../../data/api/auth_client.dart";

part "home_event.dart";
part "home_state.dart";
part "home_bloc.freezed.dart";

/// [HomeBloc] is using to manage states and events of home
@injectable
class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  /// Create instance of [HomeBloc]
  HomeBloc(this.authClient) : super(const HomeState()) {
    on<_Started>(_onStarted);
    on<_TestApi>(_onTestApi);
  }

  /// Client API
  final AuthClient authClient;

  Future<void> _onStarted(_Started event, Emitter<HomeState> emit) => runBlocCatching(
        action: () => Future<void>.delayed(const Duration(seconds: 3)),
      );

  Future<void> _onTestApi(_TestApi event, Emitter<HomeState> emit) => runBlocCatching(
        action: authClient.token,
      );
}

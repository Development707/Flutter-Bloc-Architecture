part of "home_bloc.dart";

/// Event of [HomeBloc]
@freezed
class HomeEvent with _$HomeEvent {
  /// Event started
  const factory HomeEvent.started() = _Started;

  /// Event test api
  const factory HomeEvent.testApi() = _TestApi;
}

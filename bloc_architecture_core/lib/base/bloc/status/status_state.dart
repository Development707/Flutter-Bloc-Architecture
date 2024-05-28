part of "status_cubit.dart";

/// State of [StatusCubit]
@freezed
class StatusState with _$StatusState {
  /// Creates a loading state
  const factory StatusState.loading({
    required bool useOverlay,
    double? progress,
  }) = _Loading;

  /// Creates a success state
  const factory StatusState.success() = _Success;

  /// Creates a error state
  const factory StatusState.error(Object error) = _Error;

  /// Creates a inital state
  const factory StatusState.inital() = _Inital;

  const StatusState._();

  /// Check state is loading
  bool get isLoading => maybeWhen(loading: (_, __) => true, orElse: () => false);

  /// Check state is success
  bool get isSuccess => maybeWhen(success: () => true, orElse: () => false);

  /// Check state is inital
  bool get isError => maybeWhen(error: (_) => true, orElse: () => false);

  /// Check state is loading
  bool get isInital => maybeWhen(inital: () => true, orElse: () => false);

  /// Get error of status
  Object? get error => whenOrNull(error: (Object error) => error);

  /// Get progress of status
  double? get progress => whenOrNull(loading: (_, double? progress) => progress);

  /// Get useOverlay of status
  bool? get useOverlay => whenOrNull(loading: (bool useOverlay, _) => useOverlay);
}

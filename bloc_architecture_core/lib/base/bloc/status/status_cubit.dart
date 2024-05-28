// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "dart:async";

import "package:flutter_bloc/flutter_bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "status_state.dart";
part "status_cubit.freezed.dart";

/// Status cubit of BaseBloc
class StatusCubit extends Cubit<StatusState> {
  /// Creates a StatusCubit
  StatusCubit() : super(const StatusState.inital());

  /// Change state to loading
  void loadingEmitted({bool useOverlay = true, double? progress}) => emit(StatusState.loading(
        useOverlay: useOverlay,
        progress: progress,
      ));

  /// Change state to error
  void errorEmitted(Object error) => emit(StatusState.error(error));

  /// Change state to success
  void successEmitted() => emit(const StatusState.success());

  /// Change state to inital
  void initalEmitted() => emit(const StatusState.inital());

  /// Excute function safe
  Future<void> runCubitCatching<T>({
    required Future<T> Function() action,
    FutureOr<void> Function()? doOnEventStart,
    FutureOr<void> Function(T value)? doOnSuccess,
    FutureOr<void> Function(Object error)? doOnError,
    FutureOr<void> Function()? doOnEventCompleted,
    bool autoHandleStatus = true,
  }) async {
    try {
      await doOnEventStart?.call();

      if (autoHandleStatus && !isClosed) {
        loadingEmitted();
      }

      final T value = await action.call();

      if (autoHandleStatus && !isClosed) {
        successEmitted();
      }

      await doOnSuccess?.call(value);
    } on Object catch (error, stackTrace) {
      addError(error, stackTrace);

      if (autoHandleStatus && !isClosed) {
        errorEmitted(error);
      }

      await doOnError?.call(error);
    } finally {
      await doOnEventCompleted?.call();
    }
  }
}

// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "dart:async";

import "package:hydrated_bloc/hydrated_bloc.dart";

import "mixin/log_mixin.dart";
import "status/status_cubit.dart";

/// Specialized [BaseBloc] which handles initializing the [BaseBloc] state
/// based on the persisted state. This allows state to be persisted
/// across hot restarts as well as complete app restarts.
abstract class HydratedBaseBloc<Event, State> extends BaseBloc<Event, State> with HydratedMixin<State> {
  /// Creates a BaseBloc
  HydratedBaseBloc(super.initialState) {
    hydrate();
  }

  static Storage? _storage;

  /// Setter for instance of [Storage] which will be used to
  /// manage persisting/restoring the [Bloc] state.
  static set storage(Storage? storage) => _storage = storage;

  /// Instance of [Storage] which will be used to
  /// manage persisting/restoring the [Bloc] state.
  static Storage get storage {
    if (_storage == null) {
      throw const StorageNotFound();
    }
    return _storage!;
  }
}

/// Base config bloc for app
///
/// * support `runBlocCatching` for excute function safe
/// * support loading for page
abstract class BaseBloc<Event, State> extends BaseBlocDelegate<Event, State> {
  /// Creates a BaseBloc
  BaseBloc(super.initialState);
}

/// Delegate of BaseBloc
abstract class BaseBlocDelegate<E, S> extends Bloc<E, S> with LogMixin {
  /// Creates a BaseBlocDelegate
  BaseBlocDelegate(super.initialState);

  /// Status of bloc
  final StatusCubit statusCubit = StatusCubit();

  /// Notifies the [Bloc] of a new [event] which triggers all corresponding [EventHandler] instances.
  @override
  void add(E event) {
    if (!isClosed) {
      super.add(event);
    } else {
      logE("Cannot add new event $event because $runtimeType was closed");
    }
  }

  @override
  Future<void> close() async {
    await statusCubit.close();
    return super.close();
  }

  /// Excute function safe
  Future<void> runBlocCatching<T>({
    required Future<T> Function() action,
    FutureOr<void> Function()? doOnEventStart,
    FutureOr<void> Function(T value)? doOnSuccess,
    FutureOr<void> Function(Object error)? doOnError,
    FutureOr<void> Function()? doOnEventCompleted,
    bool handleLoading = true,
  }) =>
      statusCubit.runCubitCatching(
        action: action,
        doOnEventStart: doOnEventStart,
        doOnSuccess: doOnSuccess,
        doOnError: doOnError,
        doOnEventCompleted: doOnEventCompleted,
        handleLoading: handleLoading,
      );
}

import "package:bloc_architecture_core/bloc_architecture_core.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:injectable/injectable.dart";

part "app_bloc.freezed.dart";
part "app_bloc.g.dart";
part "app_event.dart";
part "app_state.dart";

/// [AppBloc] is using to manage states and events of `App`
/// Please go to [BaseBloc] to see more information about runBlocCatching
@singleton
class AppBloc extends HydratedBaseBloc<AppEvent, AppState> {
  /// Create an AppBloc
  AppBloc() : super(const AppState()) {
    on<_ChangeThemMode>(
      (_ChangeThemMode event, Emitter<AppState> emit) => emit.call(state.copyWith(themeMode: event.themeMode)),
    );
    on<_ChangeLocale>(
      (_ChangeLocale event, Emitter<AppState> emit) => emit.call(state.copyWith(locale: event.locale)),
    );
  }

  @override
  AppState? fromJson(Map<String, dynamic> json) => AppState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(AppState state) => state.toJson();
}

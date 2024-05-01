// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:get_it/get_it.dart";

import "bloc/base_bloc.dart";
import "bloc/mixin/log_mixin.dart";
import "bloc/mixin/theme_mixin.dart";
import "bloc/status/status_cubit.dart";

/// Base config for StatefulWidget
///
///
/// Example use:
/// ```dart
/// class AppPage extends StatefulWidget {
///   const AppPage({super.key});
///
///   @override
///   State<AppPage> createState() => _AppPageState();
/// }
///
/// class _AppPageState extends BasePageState<AppPage, AppBloc> {
///   @override
///   Widget buildPage(BuildContext context) {
///     return PageWidget();
///   }
/// }
/// ```
abstract class BasePageState<Widget extends StatefulWidget, Bloc extends BaseBloc<dynamic, dynamic>>
    extends BasePageStateDelegate<Widget, Bloc> with LogMixin, ThemeMixin<Widget> {}

/// Delegate of [BasePageState]
abstract class BasePageStateDelegate<W extends StatefulWidget, B extends BaseBloc<dynamic, dynamic>> extends State<W> {
  /// This is Bloc get from GetIt
  late final B bloc = GetIt.instance.get<B>();

  /// Get status of page (Loading, success,..)
  StatusState get status => bloc.statusCubit.state;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<B>(create: (_) => bloc),
        BlocProvider<StatusCubit>.value(value: bloc.statusCubit),
      ],
      child: BlocConsumer<StatusCubit, StatusState>(
        bloc: bloc.statusCubit,
        listenWhen: handleListenWhen,
        listener: handleListener,
        buildWhen: handleBuildWhen,
        builder: handleBuilder,
      ),
    );
  }

  /// Takes the previous state and the current state and is responsible for returning a [bool]
  @protected
  bool handleListenWhen(StatusState previous, StatusState current) => current != previous;

  /// Takes the previous state and the current state and is responsible for returning a [bool]
  @protected
  bool handleBuildWhen(StatusState previous, StatusState current) => current != previous;

  /// Takes the BuildContext along with the [bloc] state and is responsible for executing in response to state changes.
  @protected
  void handleListener(BuildContext context, StatusState state) {}

  /// Build animation loading of page
  @protected
  Widget handleBuilder(BuildContext context, StatusState state) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        RepaintBoundary(child: buildPage(context)),
        Visibility(
          visible: state.isLoading,
          child: CircularProgressIndicator(value: state.progress),
        ),
      ],
    );
  }

  /// Build widget of page
  Widget buildPage(BuildContext context);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<StatusState>("status", status))
      ..add(DiagnosticsProperty<B>("bloc", bloc));
  }
}

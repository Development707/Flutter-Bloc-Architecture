import "package:bloc_architecture_core/bloc_architecture_core.dart";
import "package:flutter/material.dart";

import "../../../core/base/base.dart";
import "../../../core/config/config.dart";
import "../../../core/theme/theme.dart";
import "../../auth/auth.dart";
import "../bloc/home_bloc.dart";

/// This page home to app
class HomeScreen extends StatefulWidget {
  /// Create instance of [HomeScreen]
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends AppPageState<HomeScreen, HomeBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const HomeEvent.started());
  }

  @override
  Widget buildPage(BuildContext context) {
    return AppScaffold(
      disableGesturesOnLoad: true,
      appBar: AppBar(title: Text("Home screen - ${Config.environment?.name}")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(child: AppAssets.images.flutter.image()),
          ElevatedButton(
            onPressed: () => bloc.add(const HomeEvent.testApi()),
            child: Text(l10n.helloWorld),
          ),
          ElevatedButton(
            onPressed: () => getIt.get<AuthBloc>().add(const AuthEvent.logout()),
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}

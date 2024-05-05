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
  final ValueNotifier<int> _stepController = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    bloc.add(const HomeEvent.started());
  }

  @override
  void dispose() {
    super.dispose();
    _stepController.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    return AppScaffold(
      disableGesturesOnLoad: true,
      appBar: AppBar(title: Text("Home screen - ${Config.environment?.name}")),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: <Widget>[
          AppAssets.images.flutter.image(),
          TextButton(
            onPressed: () async => const AppAlertDialog(
              title: Text("Title"),
              content: Text("Content"),
            ).show(context),
            child: const Text("AppAlertDialog"),
          ),
          TextButton(
            onPressed: () async => AppDialog.common(
              title: const Text("Title"),
              content: const Text("Content"),
            ).show(context),
            child: const Text("AppDialog"),
          ),
          const AppDropdownField<String>(
            enableFilter: true,
            dropdownMenuEntries: <String>["item1", "item2", "item3"],
          ),
          AppTextDateField(),
          const AppTextFormField(),
          const AppTextPasswordField(),
          const AppTextQuantityField<int>(),
          ValueListenableBuilder<int>(
            valueListenable: _stepController,
            builder: (BuildContext context, int value, Widget? child) {
              return AppAnimated(
                type: AppAnimatedType.rotate,
                child: IconButton(
                  iconSize: 100,
                  key: ValueKey<int>(value),
                  onPressed: () {
                    _stepController.value = value == 0 ? 1 : 0;
                  },
                  icon: value == 0 ? const Icon(Icons.add) : const Icon(Icons.remove),
                ),
              );
            },
          ),
          AppCard(
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colorScheme.primary),
            ),
            top: const Text("Top"),
            leading: const Text("Leading"),
            content: const Text("Content"),
            trailing: const Text("Trailing"),
            bottom: const Text("Bottom"),
          ),
          AppStepper(
            controller: _stepController,
            steps: const <Step>[
              Step(title: Text("Step 1"), content: Text("Content 1")),
              Step(title: Text("Step 2"), content: Text("Content 2")),
            ],
          )
        ],
      ),
      floatingActionButton: AppFab(
        type: AppFabType.fan,
        child: const Icon(Icons.add),
        children: <Widget>[
          FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.remove), label: const Text("Remove")),
          ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.done), label: const Text("Done")),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
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
      ),
    );
  }
}

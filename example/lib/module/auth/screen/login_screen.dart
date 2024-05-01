import "package:flutter/material.dart";

import "../../../core/base/base.dart";
import "../../../data/model/response/user.dart";
import "../auth.dart";

/// This page login to app
class LoginScreen extends StatefulWidget {
  /// Create a LoginScreen
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends AppPageState<LoginScreen, AuthBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => bloc.add(const AuthEvent.login(User())),
          child: const Text("Login"),
        ),
      ),
    );
  }
}

import "package:bloc_architecture_core/base/base.dart";
import "package:bloc_architecture_localization/bloc_architecture_localization.dart";
import "package:flutter/foundation.dart";

import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";

import "../../data/model/model.dart";
import "../extension/extension.dart";
import "../theme/theme.dart";

/// Base config for StatefulWidget
abstract class AppPageState<Widget extends StatefulWidget, Bloc extends BaseBloc<dynamic, dynamic>>
    extends BasePageState<Widget, Bloc> {
  /// Localizations
  @protected
  late AppLocalizations l10n;

  /// App theme
  @protected
  late AppThemeData appTheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    l10n = context.l10n;
    appTheme = context.appTheme;
  }

  @override
  void handleListener(BuildContext context, StatusState state) {
    super.handleListener(context, state);
    if (state.isError) {
      final BlocArchitectureLocalizations? l10n = BlocArchitectureLocalizations.of(context);
      final ScaffoldMessengerState? messenger = ScaffoldMessenger.maybeOf(context);
      final String? message = AppResponse<Object?>.formError(state.error!, (Object? json) => json).when<String?>(
        success: (Object? data) => null,
        failure: (String? message) => message,
        error: (String? type) => type,
        errorHttp: (int? statusCode, String? statusMessage) => "$statusCode: $statusMessage",
        errorConnection: () => l10n?.networkConnectionIsUnstable,
        errorType: () => l10n?.pleaseUpgradeToNewVersion,
        unauthorized: () => l10n?.yourSessionHasExpiredPleaseLogInAgain,
        maintenance: () => l10n?.serverIsUnderMaintenance,
      );

      if (message != null) {
        messenger?.showSnackBar(SnackBar(content: Text(message)));
      }
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AppLocalizations>("l10n", l10n));
  }
}

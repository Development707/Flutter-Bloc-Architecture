import "package:flutter/widgets.dart";

import "../extension/extension.dart";

/// Until handle validate
class ValidateUtils {
  const ValidateUtils._();

  /// Validate password
  static String? password(String? value, {required BuildContext context}) {
    if (value == null || value.isEmpty) {
      return context.l10n.pleaseEnterPassword;
    }
    return null;
  }
}

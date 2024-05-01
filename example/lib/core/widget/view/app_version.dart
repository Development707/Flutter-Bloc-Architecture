import "package:bloc_architecture_core/extension/extension.dart";
import "package:flutter/material.dart";
import "package:package_info_plus/package_info_plus.dart";

import "../../extension/extension.dart";

/// App version widget
class AppVersion extends StatelessWidget {
  /// Create new instance of [AppVersion]
  const AppVersion({super.key, this.header = const SizedBox.shrink()});

  /// Header widget
  final Widget header;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          header,
          FutureBuilder<PackageInfo>(
            // ignore: discarded_futures
            future: PackageInfo.fromPlatform(),
            initialData: PackageInfo(appName: "", packageName: "", version: "1.0.0", buildNumber: "1"),
            builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
              final String version = "${snapshot.data!.version}.${snapshot.data!.buildNumber}";

              return Text(context.l10n.versionV(version), style: context.textTheme.bodySmall);
            },
          ),
        ],
      ),
    );
  }
}

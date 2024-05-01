# Bloc Architecture Localization

[![Pub Version](https://img.shields.io/pub/v/bloc_architecture_localization)](https://pub.dev/packages/bloc_architecture_localization)

A localization for BLoC Architecture

## Usage

1. Add `bloc_architecture_localization` to your `pubspec.yaml`
2. Applications need to include `BlocArchitectureLocalizations.delegate()` in their app's

For example:

```dart
import 'package:bloc_architecture_localization/bloc_architecture_localizations.dart';

return MaterialApp(
    localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        ...AppLocalizations.localizationsDelegates,
        BlocArchitectureLocalizations.delegate,     // <- Add this line
    ],
    supportedLocales: AppLocalizations.supportedLocales,
    home: MyApplicationHome(),
);
```

## Contributing

Contributions are always welcome!

Please check out our [contribution guidelines](https://github.com/development707/bloc_architecture/blob/main/CONTRIBUTING.md) for more details.

## License

Bloc Architecture Core is licensed under the [MIT License](https://github.com/development707/bloc_architecture/blob/main/LICENSE).

Please check out our [code of conduct](https://github.com/development707/bloc_architecture/blob/main/CODE_OF_CONDUCT.md) for more details.

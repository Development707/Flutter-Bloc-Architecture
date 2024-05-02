# BLoC Architecture Flutter

## [1. BaseBloc](./bloc_architecture_core/lib/base/bloc/base_bloc.dart)

Base config bloc for app

- Support runBlocCatching for excute function safe
- Support status for page

## [2. BasePageState](./bloc_architecture_core/lib/base/base_page_state.dart)

Base config for StatefulWidget

## [3. AppPagingController](./bloc_architecture_core/lib/base/pagination/app_paging_controller.dart)

A controller for a paged widget.
If you modify the itemList, error or nextPageKey properties, the paged widget will be notified and will update itself appropriately.

# Rule

Some rules for this project, please read carefully. If you have any questions, please contact me.

## 1. Commit

| Type     | Description                                                                                                                                             |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| feat     | some new feature                                                                                                                                        |
| fix      | fix bug                                                                                                                                                 |
| perf     | improve performance                                                                                                                                     |
| refactor | refactor code, eg. rename variable, extract method, improve architecture without changing behavior                                                      |
| docs     | update or add documentation                                                                                                                             |
| style    | update code style (white-space, formatting, missing semi-colons, etc), eg. convert 2+2 to ((2+2))                                                       |
| test     | add, update, or fix tests                                                                                                                               |
| ci       | update CI config, eg. add auto-test on PR                                                                                                               |
| chore    | update the build process, or update dependencies, or remove unnecessary files, or upgrade an dependency to a newer version, or perform any other chores |

Example:

- feat: authentication
- fix: bug login
- docs: update documentation

## 2. Branch

| Type    | Description                                                           |
| ------- | --------------------------------------------------------------------- |
| hotfix  | fix bug, quickly fix a bug in a stable release                        |
| release | fix bug, a new release of a stable version, typically a patch release |
| feature | add new feature                                                       |
| test    | add, update, or fix tests                                             |
| build   | update build process, eg. add auto-test on PR                         |

Example:

- feature/auth: add feature authentication
- test/auth: add test for authentication

## 3. Pull Request

| Type | Description |
| ---- | ----------- |
| ...  | ...         |

Example:

- ...

# Code Generator

In Flutter, code generation is used for a variety of purposes, such as generating code for working with JSON data, generating code for working with databases, and generating code for working with web services. Code generation can make it easier to write and maintain code, as it can automate repetitive tasks and reduce the amount of manual coding that is required.

- bloc_architecture_core
  ```bash
  flutter pub get
  flutter pub run build_runner build --delete-conflicting-outputs
  ```
- bloc_architecture_localization
  ```bash
  flutter pub get
  flutter gen-l10n
  ```

## [1. Freezed](https://pub.dev/packages/freezed)

Code generation for immutable classes that has a simple syntax/API without compromising on the features.

## [2. Json_serializable](https://pub.dev/packages/json_serializable)

Automatically generate code for converting to and from JSON by annotating Dart classes.

## [3. Flutter_gen](https://pub.dev/packages/flutter_gen)

The Flutter code generator for your assets, fonts, colors, … — Get rid of all String-based APIs.

## [4. Hive_generator](https://pub.dev/packages/hive_generator)

Extension for Hive. Automatically generates TypeAdapters to store any class.

## [5. injectable_generator](https://pub.dev/packages/injectable_generator)

Injectable is a convenient code generator for get_it. Inspired by Angular DI, Guice DI and inject.dart.

## [6. retrofit_generator](https://pub.dev/packages/retrofit_generator)

Generator is an dio client generator using source_gen and inspired by Chopper and Retrofit.

## [7. go_router_builder](https://pub.dev/packages/go_router_builder)

A builder that supports generated strongly-typed route helpers for package:go_router

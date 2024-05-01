import "dart:io" show Directory;

import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:get_it/get_it.dart";
import "package:hydrated_bloc/hydrated_bloc.dart";
import "package:injectable/injectable.dart";
import "package:path_provider/path_provider.dart";

import "../../data/dio/app_interceptor.dart";
import "../../data/dio/token_interceptor.dart";
import "config.dart";
import "injector.config.dart";

/// Object get instance
final GetIt getIt = GetIt.instance;

/// Inita load config from injectable
@injectableInit
Future<void> configureInjection({String? environment, EnvironmentFilter? environmentFilter}) => getIt.init(
      environment: environment,
      environmentFilter: environmentFilter,
    );

/// Module for network
@module
abstract class InjectModuleNetwork {
  /// Create the default [Dio] instance with the default implementation based on different platforms.
  @lazySingleton
  Dio createDio() {
    final Dio dio = Dio()
      ..interceptors.add(TokenInterceptor())
      ..interceptors.add(AppInterceptor());

    return dio;
  }

  /// Network base url from environment
  @prod
  @dev
  @Named("BaseUrl")
  String get baseUrl => Config.baseUrl;

  /// Network base url from environment test
  @test
  @Named("BaseUrl")
  String get testBaseUrl => "https://mock";
}

/// Module for Storage
@module
abstract class InjectModuleStorage {
  /// Sentinel directory used to determine that web storage should be used when initializing [HydratedStorage].
  @preResolve
  @Singleton(order: -1)
  Future<Directory> get storageDirectory {
    if (kIsWeb) {
      return Future<Directory>.value(HydratedStorage.webStorageDirectory);
    }
    return getApplicationDocumentsDirectory();
  }

  /// Returns an instance of [HydratedStorage]. [storageDirectory] is required.
  @preResolve
  @Singleton(order: -1)
  Future<Storage> getStorage(Directory storageDirectory) async {
    final HydratedStorage storage = await HydratedStorage.build(storageDirectory: storageDirectory);
    HydratedBloc.storage = storage;

    return storage;
  }
}

import "package:dio/dio.dart";

import "../../core/config/config.dart";

/// [AppInterceptor] is used to handle config api
class AppInterceptor extends Interceptor {
  /// Add config api to header
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(<String, dynamic>{"Api-Key": Config.apiKey});
    super.onRequest(options, handler);
  }
}

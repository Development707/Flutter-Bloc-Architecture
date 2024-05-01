import "package:dio/dio.dart";

import "../../core/config/config.dart";

/// [AppInterceptor] is used to handle config api
class AppInterceptor extends Interceptor {
  /// Add config api to header
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(<String, dynamic>{"API-KEY": Config.apiKey});

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    final dynamic data = response.data;

    if (data is Map<String, dynamic>) {
      if (data["success"] is bool) {
        final bool success = data["success"] as bool;

        /// Convert field success bool to string
        data["success"] = success ? "true" : "false";

        /// Reject request if field success is false
        if (!success) {
          return handler.reject(
            DioException.badResponse(statusCode: 400, requestOptions: response.requestOptions, response: response),
          );
        }
      }
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final dynamic data = err.response?.data;

    if (data is Map<String, dynamic>) {
      if (data["success"] is bool) {
        final bool success = data["success"] as bool;

        /// Convert field success bool to string
        data["success"] = success ? "true" : "false";
      }
    }

    super.onError(err, handler);
  }
}

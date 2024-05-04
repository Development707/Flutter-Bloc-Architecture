import "package:dio/dio.dart";

import "../../core/config/config.dart";
import "../../module/auth/auth.dart";

/// [TokenInterceptor] is used to handle token during network requests.
class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(<String, dynamic>{"Authorization": "Bearer ${getIt.get<AuthBloc>().state.token}"});
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      getIt.get<AuthBloc>().add(const AuthEvent.logout());
    }
    super.onError(err, handler);
  }
}

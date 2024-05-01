import "package:dio/dio.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "app_response.freezed.dart";
part "app_response.g.dart";

/// App response app
@Freezed(genericArgumentFactories: true, unionKey: "success")
sealed class AppResponse<T> with _$AppResponse<T> {
  /// unionKey: true
  ///
  /// Show when response field is success: true
  @FreezedUnionValue("true")
  const factory AppResponse.success(T? data) = _AppResponseSuccess<T>;

  /// unionKey: false
  ///
  /// Show when response field is success: false
  @FreezedUnionValue("false")
  const factory AppResponse.failure(String? message) = _AppResponseFailure<T>;

  /// unionKey: unauthorized
  ///
  /// Show when response field is success: unauthorized
  const factory AppResponse.unauthorized() = _AppResponseUnauthorized<T>;

  /// unionKey: maintenance
  ///
  /// Show when response field is success: maintenance
  const factory AppResponse.maintenance() = _AppResponseMaintenance<T>;

  /// unionKey: error
  ///
  /// Show when error unknown
  const factory AppResponse.error(String? type) = _AppResponseError<T>;

  /// unionKey: errorHttp
  ///
  /// Show when error http
  const factory AppResponse.errorHttp(int? statusCode, String? statusMessage) = _AppResponseErrorHttp<T>;

  /// unionKey: errorConnection
  ///
  /// Show when can not connect to server
  const factory AppResponse.errorConnection() = _AppResponseErrorConnection<T>;

  /// unionKey: errorConvert
  ///
  /// Show when can not convert data from server to [AppResponse]
  const factory AppResponse.errorType() = _AppResponseErrorType<T>;

  const AppResponse._();

  /// Creates a [AppResponse] from [json] with [fromJsonT].
  factory AppResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$AppResponseFromJson(json, fromJsonT);

  /// Creates a [AppResponse] from a [error] with [fromJsonT].
  factory AppResponse.formError(Object error, T Function(Object? json) fromJsonT) {
    if (error is AppResponse<T>) {
      return error;
    } else if (error is DioException) {
      switch (error.type) {
        /// Error conection
        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return AppResponse<T>.errorConnection();

        /// Error response
        case DioExceptionType.badResponse:
          try {
            if (error.response?.statusCode == 401) {
              return AppResponse<T>.unauthorized();
            } else if ((error.response?.statusCode ?? 0) >= 500 && (error.response?.statusCode ?? 0) < 600) {
              return AppResponse<T>.maintenance();
            } else {
              return AppResponse<T>.fromJson(error.response?.data, fromJsonT);
            }
          } on Object catch (_) {
            return AppResponse<T>.errorHttp(error.response?.statusCode, error.response?.statusMessage);
          }

        /// Error server
        case DioExceptionType.badCertificate:
        case DioExceptionType.cancel:
        case DioExceptionType.unknown:
          return AppResponse<T>.error(error.type.name);
      }
    } else if (error is FormatException || error is TypeError) {
      return AppResponse<T>.errorType();
    } else if (error is Exception || error is Error) {
      return AppResponse<T>.error(error.toString());
    }

    return AppResponse<T>.error(error.runtimeType.toString());
  }

  /// Get data
  T? get data => whenOrNull(success: (T? data) => data);

  /// Get status code
  int? get statusCode => whenOrNull(errorHttp: (int? statusCode, String? statusMessage) => statusCode);

  /// Get status message
  String? get statusMessage => whenOrNull(errorHttp: (int? statusCode, String? statusMessage) => statusMessage);

  /// Get error message
  String? get errorMessage => whenOrNull(failure: (String? message) => message);
}

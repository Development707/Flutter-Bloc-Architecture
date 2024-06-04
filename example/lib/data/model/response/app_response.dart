import "package:dio/dio.dart";
import "package:freezed_annotation/freezed_annotation.dart";

import "../../../core/base/app_pagination.dart";

part "app_response.freezed.dart";
part "app_response.g.dart";

/// App response app
@Freezed(genericArgumentFactories: true, unionKey: "status")
class AppResponse<T> with _$AppResponse<T> {
  /// unionKey: data
  ///
  /// Show when response field is success
  const factory AppResponse.data(T data) = AppResponseData<T>;

  /// unionKey: page
  ///
  /// Show when response field is page
  @With.fromString("AppPagination<T>")
  const factory AppResponse.page(List<T> data, int page, int perPage, int totalElements) = AppResponsePage<T>;

  /// unionKey: failure
  ///
  /// Show when response field is failure
  const factory AppResponse.failure(String message) = _AppResponseFailure<T>;

  /// unionKey: unauthorized
  ///
  /// Show when response field is unauthorized
  const factory AppResponse.unauthorized() = _AppResponseUnauthorized<T>;

  /// unionKey: maintenance
  ///
  /// Show when response field is maintenance
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
}

/// Common get value
extension CommonAppResponse<T> on AppResponse<T> {
  /// Get data
  T? get data => whenOrNull(data: (T data) => data);

  /// Get data page
  List<T>? get dataPage => whenOrNull(page: (List<T> data, _, __, ___) => data);

  /// Page number
  int? get page => whenOrNull(page: (_, int page, __, ___) => page);

  /// Page size
  int? get perPage => whenOrNull(page: (_, __, int perPage, ___) => perPage);

  /// Total elements
  int? get totalElements => whenOrNull(page: (_, __, ___, int totalElements) => totalElements);

  /// Get status code
  int? get statusCode => whenOrNull(errorHttp: (int? statusCode, String? statusMessage) => statusCode);

  /// Get status message
  String? get statusMessage => whenOrNull(errorHttp: (int? statusCode, String? statusMessage) => statusMessage);

  /// Get error message
  String? get errorMessage => whenOrNull(failure: (String? message) => message);
}

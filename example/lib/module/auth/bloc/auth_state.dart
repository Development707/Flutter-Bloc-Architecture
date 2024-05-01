part of "auth_bloc.dart";

/// State authen of Appp
@freezed
class AuthState with _$AuthState {
  /// State not login app
  const factory AuthState.unregistered() = _Unregistered;

  /// State has login user app
  const factory AuthState.loggedIn(User user, {String? token}) = _LoggedIn;

  /// State login user expired
  const factory AuthState.sessionExpired(User user) = _SessionExpired;

  const AuthState._();

  /// Create state form JSON
  factory AuthState.fromJson(Map<String, dynamic> json) => _$AuthStateFromJson(json);

  /// Check has login
  bool get isAuthenticated => maybeWhen<bool>(loggedIn: (User user, String? token) => true, orElse: () => false);

  /// Get user
  User? get user => whenOrNull<User>(loggedIn: (User user, String? token) => user, sessionExpired: (User user) => user);

  /// Get token
  String? get token => whenOrNull(loggedIn: (User user, String? token) => token);
}

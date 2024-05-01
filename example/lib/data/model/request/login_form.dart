import "package:freezed_annotation/freezed_annotation.dart";

part "login_form.freezed.dart";
part "login_form.g.dart";

/// Model form call API login
@freezed
class LoginForm with _$LoginForm {
  /// Create a LoginForm
  const factory LoginForm({
    String? phone,
    String? email,
    String? password,
  }) = _LoginForm;

  const LoginForm._();

  /// Create a LoginForm from JSON
  factory LoginForm.fromJson(Map<String, dynamic> json) => _$LoginFormFromJson(json);
}

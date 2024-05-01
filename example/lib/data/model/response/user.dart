import "package:freezed_annotation/freezed_annotation.dart";

part "user.freezed.dart";
part "user.g.dart";

/// User respone api
@freezed
class User with _$User {
  /// Create a User
  const factory User({
    int? id,
    String? name,
    String? phone,
    String? email,
  }) = _User;

  const User._();

  /// Create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

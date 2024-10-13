import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

// {
//   "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImpvaG4uZG9lQGV4YW1wbGUuY29tIiwic3ViIjoxLCJpYXQiOjE3Mjg3NDQzMTksImV4cCI6MTcyODc0NzkxOX0.5iABYI265-B9D-tfuHk6rynTMLQnLGz9X9pzaOBuAbQ",
//   "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImpvaG4uZG9lQGV4YW1wbGUuY29tIiwic3ViIjoxLCJpYXQiOjE3Mjg3NDQzMTksImV4cCI6MTcyOTM0OTExOX0.Y0oqj9iMO3bnv3trEvLC7GquI6Ph1WFlogexRy0jIv8"
// }

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends INetworkModel<LoginResponse> with EquatableMixin {
  LoginResponse({this.accessToken, this.refreshToken});

  /// Get user from json
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  final String? accessToken;
  final String? refreshToken;

  @override
  List<Object?> get props => [accessToken, refreshToken];

  /// User model to map object
  @override
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  LoginResponse fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }

  LoginResponse copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return LoginResponse(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}

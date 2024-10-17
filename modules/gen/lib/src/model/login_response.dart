import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

// {
//   "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImpvaG4uZG9lQGV4YW1wbGUuY29tIiwic3ViIjoxLCJpYXQiOjE3Mjg3NDQzMTksImV4cCI6MTcyODc0NzkxOX0.5iABYI265-B9D-tfuHk6rynTMLQnLGz9X9pzaOBuAbQ",
//   "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImpvaG4uZG9lQGV4YW1wbGUuY29tIiwic3ViIjoxLCJpYXQiOjE3Mjg3NDQzMTksImV4cCI6MTcyOTM0OTExOX0.Y0oqj9iMO3bnv3trEvLC7GquI6Ph1WFlogexRy0jIv8"
// }

part 'login_response.g.dart';

/// A model class representing the response received after a login attempt.
///
/// The [LoginResponse] class contains the following properties:
/// - [accessToken]: A token used to access protected resources.
/// - [refreshToken]: A token used to obtain a new access token when the current one expires.
/// This class contains the access token provided by the server upon successful
/// authentication.
///
/// Parameters:
/// - `accessToken`: The token used to authenticate subsequent requests.
/// This class extends [INetworkModel] to provide network-related functionalities
/// specific to the login response.
///
/// Example usage:
/// ```dart
/// final loginResponse = LoginResponse();
/// // Use loginResponse to access login-related data
/// ```
///
/// See also:
/// - [INetworkModel] for network model functionalities.
/// Represents the response received after a login attempt.
///
/// This class extends [INetworkModel] to provide network-related functionalities
/// for the login response.
///
/// Example usage:
///
/// ```dart
/// LoginResponse response = LoginResponse();
/// // Use the response object as needed
/// ```
///
/// The [LoginResponse] class can be used to parse and handle the data
/// returned from a login API call.
@JsonSerializable()
@immutable
class LoginResponse extends INetworkModel<LoginResponse> {
  const LoginResponse({this.accessToken, this.refreshToken});

  ///[accessToken] is the token used to authenticate subsequent requests.
  @JsonKey(name: 'access_token')
  final String? accessToken;

  ///[refreshToken] is the token used to refresh the access token.
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  @override
  LoginResponse fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'accessToken': accessToken,
    };
  }
}

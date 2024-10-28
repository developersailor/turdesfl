import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

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
  const LoginResponse({this.accessToken, this.refreshToken, this.userId});

  ///[accessToken] is the token used to authenticate subsequent requests.
  @JsonKey(name: 'access_token')
  final String? accessToken;

  ///[refreshToken] is the token used to refresh the access token.
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  final int? userId;

  @override
  LoginResponse fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() => _$LoginResponseToJson(this);
}

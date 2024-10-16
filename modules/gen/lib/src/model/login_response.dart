import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

// {
//   "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImpvaG4uZG9lQGV4YW1wbGUuY29tIiwic3ViIjoxLCJpYXQiOjE3Mjg3NDQzMTksImV4cCI6MTcyODc0NzkxOX0.5iABYI265-B9D-tfuHk6rynTMLQnLGz9X9pzaOBuAbQ",
//   "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImpvaG4uZG9lQGV4YW1wbGUuY29tIiwic3ViIjoxLCJpYXQiOjE3Mjg3NDQzMTksImV4cCI6MTcyOTM0OTExOX0.Y0oqj9iMO3bnv3trEvLC7GquI6Ph1WFlogexRy0jIv8"
// }

part 'login_response.g.dart';

@JsonSerializable()
@immutable
class LoginResponse extends INetworkModel<LoginResponse> {
  LoginResponse({this.accessToken});
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;

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

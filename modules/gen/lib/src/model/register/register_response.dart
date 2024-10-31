/**
 * 
 * {
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImpvaG4uZWRvQGV4YW1wbGUuY29tIiwic3ViIjozLCJpYXQiOjE3MzAyNzgzMzgsImV4cCI6MTczMDI4MTkzOH0._gCMGHHi9rNA-1UrPjzT-ECKNxwxRUgVQmngyG0ViZw",
  "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImpvaG4uZWRvQGV4YW1wbGUuY29tIiwic3ViIjozLCJpYXQiOjE3MzAyNzgzMzgsImV4cCI6MTczMDg4MzEzOH0.MgAlPTt_OIhxQH97CkrjLxfPgVccyNQ6--c_0_2Qgc8",
  "userId": 3
} response
 */
library;

import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse extends INetworkModel<RegisterResponse> {
  const RegisterResponse({this.accessToken, this.refreshToken, this.userId});
  final String? accessToken;
  final String? refreshToken;
  final int? userId;

  @override
  RegisterResponse fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$RegisterResponseToJson(this);
  }
}

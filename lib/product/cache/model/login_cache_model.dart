import 'package:core/core.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

final class LoginCacheModel with CacheModel {
  LoginCacheModel({required this.loginResponse});
  LoginCacheModel.empty() : loginResponse = LoginResponse();
  final LoginResponse loginResponse;

  @override
  LoginCacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      CustomLogger.showError<LoginResponse>('Json cannot be null');
      return this;
    }
    return copyWith(
      loginResponse: LoginResponse.fromJson(jsonMap),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return loginResponse.toJson();
  }

  LoginCacheModel copyWith({
    LoginResponse? loginResponse,
  }) {
    return LoginCacheModel(
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }
}

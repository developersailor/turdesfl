import 'package:gen/gen.dart';

abstract class AuthenticationOperation {
  Future<LoginResponse> login(String? email, String? password);
}

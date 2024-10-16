import 'package:gen/gen.dart';

abstract class LoginOperation {
  Future<LoginResponse?> login(String? email, String? password);
}

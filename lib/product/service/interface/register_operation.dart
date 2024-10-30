import 'package:gen/gen.dart';

abstract class RegisterOperation {
  Future<RegisterResponse?> register(RegisterPayload payload);
}

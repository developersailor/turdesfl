import 'package:gen/gen.dart';
import 'package:turdes/product/service/manager/product_service_path.dart';
import 'package:vexana/vexana.dart';

class LoginService {
  LoginService(this._networkManager);
  final INetworkManager _networkManager;

  Future<LoginResponse?> login(String email, String password) async {
    final response = await _networkManager.send<LoginResponse, LoginResponse>(
      ProductServicePath.login.value,
      parseModel: const LoginResponse(),
      method: RequestType.POST,
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.data != null) {
      return response.data;
    } else {
      // Handle error or null response
      return null;
    }
  }

  Future<void> resetPassword(String email) async {
    final response = await _networkManager.send<void, void>(
      ProductServicePath.login.value + '/reset-password',
      method: RequestType.POST,
      data: {
        'email': email,
      },
    );

    if (response.error != null) {
      // Handle error
      throw Exception('Failed to reset password');
    }
  }

  Future<void> verifyEmail(String email) async {
    final response = await _networkManager.send<void, void>(
      ProductServicePath.login.value + '/verify-email',
      method: RequestType.POST,
      data: {
        'email': email,
      },
    );

    if (response.error != null) {
      // Handle error
      throw Exception('Failed to verify email');
    }
  }
}

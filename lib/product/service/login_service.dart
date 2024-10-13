// ignore_for_file: public_member_api_docs

import 'package:gen/gen.dart';
import 'package:turdes/product/service/interface/authentication_operation.dart';
import 'package:turdes/product/service/manager/product_service_manager.dart';
import 'package:turdes/product/service/manager/product_service_path.dart';
import 'package:vexana/vexana.dart';

final class LoginService extends AuthenticationOperation {
  LoginService({
    required ProductNetworkManager productNetworkManager,
  }) : _networkManager = productNetworkManager;
  final INetworkManager<EmptyModel> _networkManager;

  @override
  Future<LoginResponse> login(String? email, String? password) async {
    final response = await _networkManager.send<LoginResponse, LoginResponse>(
      ProductServicePath.login.value,
      parseModel: LoginResponse(),
      method: RequestType.POST,
      data: {
        'email': email,
        'password': password,
      },
    );

    return response.data ?? LoginResponse();
  }
}

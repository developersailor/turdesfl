// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:gen/gen.dart';
import 'package:turdes/product/service/manager/product_service_manager.dart';
import 'package:turdes/product/service/manager/product_service_path.dart';
import 'package:vexana/vexana.dart';

class LoginService {
  LoginService(this._networkManager);
  final INetworkManager _networkManager;

  Future<LoginResponse?> login(String email, String password) async {
    final response = await _networkManager.send<LoginResponse, LoginResponse>(
      ProductServicePath.login.value,
      parseModel: LoginResponse(),
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
}

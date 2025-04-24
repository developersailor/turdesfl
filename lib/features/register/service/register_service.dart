import 'package:gen/gen.dart';
import 'package:turdes/product/service/interface/register_operation.dart';
import 'package:turdes/product/service/manager/index.dart';
import 'package:vexana/vexana.dart';

class RegisterService extends RegisterOperation {
  RegisterService({required ProductNetworkManager productServiceManager})
    : _productServiceManager = productServiceManager;
  final ProductNetworkManager _productServiceManager;
  @override
  Future<RegisterResponse?> register(RegisterPayload payload) async {
    final response = await _productServiceManager
        .send<RegisterResponse, RegisterResponse>(
          ProductServicePath.register.value,
          parseModel: const RegisterResponse(),
          method: RequestType.POST,
          data: {
            'name': payload.name,
            'email': payload.email,
            'phone': payload.phone,
            'password': payload.password,
            'role': 'user',
          },
        );
    return response.data;
  }
}

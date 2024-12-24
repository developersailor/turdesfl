import 'package:gen/gen.dart';
import 'package:turdes/product/cache/product_cache.dart';
import 'package:turdes/product/service/interface/aidrequest_operation.dart';
import 'package:turdes/product/service/manager/product_service_path.dart';
import 'package:vexana/vexana.dart';

class AidrequestService extends AidrequestOperation {
  AidrequestService(this._networkManager, this._productCache);
  final INetworkManager _networkManager;
  final ProductCache _productCache;

  @override
  Future<List<AidrequestResponse>> getAidrequestList() async {
    final token = await _productCache.loginCacheOperation.read('token');
    final response = await _networkManager
        .send<AidrequestResponse, List<AidrequestResponse>>(
      ProductServicePath.aidrequest.value,
      parseModel: const AidrequestResponse(),
      method: RequestType.GET,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    if (response.data != null) {
      return response.data ?? [];
    }
    return response.data ?? [];
  }

  @override
  Future<AidrequestResponse?> createAidrequest(
    AidrequestPayload? request,
  ) async {
    final token = await _productCache.loginCacheOperation.read('token');
    final response =
        await _networkManager.send<AidrequestResponse, AidrequestResponse>(
      ProductServicePath.aidrequest.value,
      parseModel: const AidrequestResponse(),
      method: RequestType.POST,
      data: {
        'userId': request?.userId,
        'organizationId': request?.organizationId,
        'type': request?.type,
        'description': request?.description,
        'status': request?.status,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    if (response.data != null) {
      return response.data;
    }
    return null;
  }

  Future<AidrequestResponse?> getAidrequestDetail(int aidRequestId) async {
    final token = await _productCache.loginCacheOperation.read('token');
    final response = await _networkManager.send<AidrequestResponse, AidrequestResponse>(
      ProductServicePath.aidrequest.withQuery(aidRequestId.toString()),
      parseModel: const AidrequestResponse(),
      method: RequestType.GET,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    if (response.data != null) {
      return response.data;
    }
    return null;
  }

  Future<bool> postComment(int aidRequestId, String comment) async {
    final token = await _productCache.loginCacheOperation.read('token');
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ProductServicePath.aidrequest.withQuery('$aidRequestId/comments'),
      parseModel: const EmptyModel(),
      method: RequestType.POST,
      data: {
        'comment': comment,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response.data != null;
  }
}

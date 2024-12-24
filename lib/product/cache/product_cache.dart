import 'package:core/core.dart';
import 'package:turdes/product/cache/model/login_cache_model.dart';

/// [ProductCache] is a cache manager for the product module.
final class ProductCache {
  ProductCache({required CacheManager cacheManager})
      : _cacheManager = cacheManager;

  final CacheManager _cacheManager;

  Future<void> init() async {
    await _cacheManager.init(
      items: [
        LoginCacheModel.empty(),
      ],
    );
  }

  late final SecureCacheManager userCacheOperation = SecureCacheManager(
    path: 'user',
  );
  late final SecureCacheManager loginCacheOperation = SecureCacheManager(
    path: 'login',
  );

  Future<void> saveJwtToken(String token) async {
    await userCacheOperation.write('jwt_token', token);
  }

  Future<String?> getJwtToken() async {
    return await userCacheOperation.read('jwt_token');
  }
}

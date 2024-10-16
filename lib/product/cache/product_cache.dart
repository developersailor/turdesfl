import 'package:core/core.dart';
import 'package:turdes/product/cache/model/login_cache_model.dart';
import 'package:turdes/product/cache/model/user_cache_model.dart';

/// [ProductCache] is a cache manager for the product module.
final class ProductCache {
  ProductCache({required CacheManager cacheManager})
      : _cacheManager = cacheManager;

  final CacheManager _cacheManager;

  Future<void> init() async {
    await _cacheManager.init(
      items: [
        UserCacheModel.empty(),
        LoginCacheModel.empty(),
      ],
    );
  }

  late final SecureCacheManager userCacheOperation = SecureCacheManager(
    path: 'user',
  );
}

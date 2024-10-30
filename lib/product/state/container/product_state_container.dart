import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:turdes/features/aidrequest/bloc/aidrequest_bloc.dart';

import 'package:turdes/features/aidrequest/services/aidrequest_service.dart';
import 'package:turdes/features/login/bloc/login_bloc.dart';
import 'package:turdes/product/cache/product_cache.dart';
import 'package:turdes/features/login/service/login_service.dart';
import 'package:turdes/product/service/manager/product_service_manager.dart';
import 'package:turdes/product/state/view_model/product_view_model.dart';

/// Product container for dependency injection
final class ProductContainer {
  const ProductContainer._();
  static final _getIt = GetIt.I;

  /// Product core required items
  static void setup() {
    // 1. Gerekli bağımlılıkları kaydedin
    _getIt
      ..registerSingleton<ProductCache>(
        ProductCache(cacheManager: SecureCacheManager()),
      )
      ..registerSingleton<ProductNetworkManager>(
        ProductNetworkManager.base(),
      )
      ..registerLazySingleton<ProductViewModel>(
        ProductViewModel.new,
      )
      // AuthenticationService'i kaydedin
      ..registerLazySingleton<LoginService>(
        () => LoginService(
          _getIt<ProductNetworkManager>(),
        ),
      )
      ..registerFactory<LoginBloc>(
        () => LoginBloc(
          authenticationOperation: _getIt<LoginService>(),
          productCache: _getIt<ProductCache>(),
        ),
      )
      ..registerLazySingleton<AidrequestService>(
        () => AidrequestService(
          _getIt<ProductNetworkManager>(),
          _getIt<ProductCache>(),
        ),
      )
      ..registerFactory<AidrequestBloc>(
        () => AidrequestBloc(
          _getIt<AidrequestService>(),
        ),
      );
  }

  /// read your dependency item for [ProductContainer]
  static T read<T extends Object>() => _getIt<T>();
}

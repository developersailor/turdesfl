import 'package:envied/envied.dart';
import 'package:gen/src/environment/app_configuration.dart';

part 'prod_env.g.dart';

@Envied(path: 'assets/env/.prod.env', obfuscate: true)

/// Production environment variables
final class ProdEnv implements AppConfiguration {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _ProdEnv._baseUrl;

  @override
  String get baseUrl => _baseUrl;
}

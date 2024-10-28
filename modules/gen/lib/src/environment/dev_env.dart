import 'package:envied/envied.dart';
import 'package:gen/src/environment/app_configuration.dart';

part 'dev_env.g.dart';

@Envied(path: 'assets/env/.dev.env', obfuscate: true)

/// Production environment variables
final class DevEnv implements AppConfiguration {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _DevEnv._baseUrl;

  @EnviedField(varName: 'TOKEN')
  static final String _token = _DevEnv._token;

  @override
  String get baseUrl => _baseUrl;
  @override
  String get token => _token;
}

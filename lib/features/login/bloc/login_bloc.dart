// login_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:turdes/features/login/bloc/login_state.dart';
import 'package:turdes/features/login/service/login_service.dart';
import 'package:turdes/product/cache/product_cache.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required LoginService authenticationOperation,
    required ProductCache productCache,
  })  : _authenticationOperation = authenticationOperation,
        _productCache = productCache,
        super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }
  final LoginService _authenticationOperation;
  final ProductCache _productCache; // Constructor burada kapanıyor

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    print('LoginLoading state emitted');
    try {
      final response = await _authenticationOperation.login(
        event.email,
        event.password,
      );
      print('Gönderilen Veri: ${event.email}, ${event.password}');
      print('API Yanıtı: ${response?.accessToken}');

      if (response?.accessToken != null) {
        // Token'ı kaydet
        saveToken(response!.accessToken);
        print('LoginSuccess state emitted');
        emit(LoginSuccess());
      } else {
        // Null yanıtı işleyin
        print('Error: API response is null or accessToken is null');
        emit(LoginFailure(error: 'Invalid response from server'));
      }
    } catch (error) {
      print('Error: $error');
      emit(LoginFailure(error: error.toString()));
    }
  }

  void saveToken(String? token) {
    _productCache.userCacheOperation.write('token', token!);
  }
}

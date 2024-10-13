// login_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:turdes/features/login/bloc/login_state.dart';
import 'package:turdes/product/cache/product_cache.dart';
import 'package:turdes/product/service/login_service.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required LoginService authenticationOperation,
    required ProductCache productCache,
  })  : _authenticationOperation = authenticationOperation,
        _productCache = productCache,
        super(LoginInitial()) {
    on<LoginButtonPressed>(_login);
  }
  final LoginService _authenticationOperation;
  final ProductCache _productCache; // Constructor burada kapanıyor

  Future<void> _login(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    final response = await _authenticationOperation.login(
      event.email,
      event.password,
    );
    if (response.accessToken != null) {
      // Token'ı kaydet
      saveToken(response.accessToken);

      emit(LoginSuccess());
    }
  }

  void saveToken(String? token) {
    _productCache.userCacheOperation.write('token', token!);
  }
}

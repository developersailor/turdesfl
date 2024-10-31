import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';
import 'package:turdes/features/register/service/register_service.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this._registerService) : super(const RegisterState()) {
    on<RegisterUser>(_onRegisterUser);
  }

  final RegisterService _registerService;

  Future<void> _onRegisterUser(
    RegisterUser event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(status: RegisterStatus.loading));
    try {
      final response = await _registerService.register(event.payload);
      if (response != null) {
        emit(
          state.copyWith(status: RegisterStatus.success, response: response),
        );
      } else {
        emit(
          state.copyWith(
            status: RegisterStatus.failure,
            errorMessage: 'Registration failed',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}

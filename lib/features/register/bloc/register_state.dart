part of 'register_bloc.dart';

enum RegisterStatus { initial, loading, success, failure }

class RegisterState extends Equatable {
  const RegisterState({
    this.status = RegisterStatus.initial,
    this.response,
    this.errorMessage,
  });

  final RegisterStatus status;
  final RegisterResponse? response;
  final String? errorMessage;

  RegisterState copyWith({
    RegisterStatus? status,
    RegisterResponse? response,
    String? errorMessage,
  }) {
    return RegisterState(
      status: status ?? this.status,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, response, errorMessage];
}

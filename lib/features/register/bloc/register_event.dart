part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUser extends RegisterEvent {
  const RegisterUser(this.payload);
  final RegisterPayload payload;

  @override
  List<Object> get props => [payload];
}

part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class OneIdEvent extends AuthEvent {
  final String code;

  OneIdEvent({required this.code});

  @override
  // TODO: implement props
  List<Object?> get props => [code];
}

class LoginEvent extends AuthEvent {
  final LoginBody body;

  LoginEvent({required this.body});

  @override
  // TODO: implement props
  List<Object?> get props => [body];
}
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}
class LoginWithCredentialsPressedEvent extends AuthEvent {
  final LoginParams loginParams;

  LoginWithCredentialsPressedEvent({required this.loginParams});

  @override
  List<Object> get props => [loginParams];
}

class TimeOut extends AuthEvent{
  const TimeOut();
  @override
  List<Object> get props => [];
}
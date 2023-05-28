// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}
class LoadingState extends AuthState{}
class LoginSucces extends AuthState{} 
class LoginFailure extends AuthState {
  String? message;
  LoginFailure({
   required this.message,
  });
 @override
  List<Object> get props=> [message!];
}
class AutoLogOut extends AuthState {
const AutoLogOut();
 @override
  List<Object> get props=> [];
}
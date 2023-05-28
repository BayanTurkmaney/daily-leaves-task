import 'package:daily_leaves_task/core/usecases/usecase.dart';

class LoginParams implements Params{
  final String username;
  final String password;

  LoginParams({required this.username, required this.password});
  @override
  // TODO: implement data
  get data => [username,password];

}
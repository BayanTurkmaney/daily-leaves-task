

import 'package:daily_leaves_task/core/usecases/usecase.dart';
import 'package:daily_leaves_task/features/auth/data/models/user_model.dart';

import '../../entities/user.dart';

class LoginResponse implements Response {
  String? accessToken;
  String? expiration;
  String? refreshToken;
  User? user;
  num? response;
  String? message;
  LoginResponse({
     this.accessToken,
     this.expiration,
     this.refreshToken,
     this.user,
     this.response,
     this.message,
  });
  @override
  // TODO: implement data
  get data => [
    accessToken,
    expiration,
    refreshToken,
    user,    
    response,
    message
  ];


  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'expiration': expiration,
      'refreshToken': refreshToken,
      'user': (user as UserModel).toJson(),
      'response': response,
      'message': message,
    };
  }

  factory LoginResponse.fromJson(Map<String, dynamic> map) {
    return LoginResponse(
      accessToken: map['accessToken'] != null ? map['accessToken'] as String : null,
      expiration: map['expiration'] != null ? map['expiration'] as String : null,
      refreshToken: map['refreshToken'] != null ? map['refreshToken'] as String : null,
      user: map['user'] != null ? UserModel.fromJson(map['user'] as Map<String,dynamic>) : null,
      response: map['response'] != null ? map['response'] as num : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  
}

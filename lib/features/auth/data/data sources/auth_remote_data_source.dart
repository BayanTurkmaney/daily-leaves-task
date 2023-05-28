

import 'package:dio/dio.dart';
import 'package:daily_leaves_task/core/error/exception.dart';
import 'package:daily_leaves_task/features/auth/data/data%20sources/auth_local_data_source.dart';
import 'package:daily_leaves_task/features/auth/data/models/company_model.dart';
import 'package:daily_leaves_task/features/auth/data/models/user_model.dart';
import 'package:daily_leaves_task/features/auth/domain/usecases/login/login_response.dart';

import '../../domain/usecases/login/login_params.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(LoginParams? params);
}

class AuthRemoteImplWithDio implements AuthRemoteDataSource {
  late LoginResponse loginResponse;
  late AuthLocalImplWithSharedPref authLocal;
  String? token;
  late Dio dio; 
  bool get isLoggedIn => AuthLocalImplWithSharedPref.getToken() != null;

  AuthRemoteImplWithDio() {
    BaseOptions options = BaseOptions(
        headers: {'Content-type': 'application/json'},
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        receiveDataWhenStatusError: true);

    dio = Dio(options);
    authLocal = AuthLocalImplWithSharedPref();
  }

  @override
  Future<LoginResponse> login(LoginParams ?param) async {
    List<CompanyModel>? list = [];
    // if(param!.username=='eshemp' && param.password=='Eshemp@123'){
    var body = {"username": 'eshemp', "password": 'Eshemp@123'};
    try {
        print('KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK');
      var res = await dio.post(
          'https://staging.api.hr-portals.com/api/v1/Auth/login',
          data: body);

      var jsonEmpInfo = res.data;
      print(res.statusCode);
      if (res.statusCode == 200) {
       print('KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK');
        var x = jsonEmpInfo['data'];
        token = x['accessToken'];
        loginResponse = LoginResponse(
            accessToken: x['accessToken'],
            expiration: x['expiration'],
            message: x['message'],
            refreshToken: x['refreshToken'],
            response: x['response'],
            user: UserModel(
              username: x['user']['username'] as String,
              email: x['user']['email'],
              companys: x['user']['companys'] == []
                  ? list
                  : x['user']['companys']
                      .map((v) => CompanyModel(
                          companyName: v.companyName,
                          businessType: v.businessType))
                      .toList(),
            ));
        await AuthLocalImplWithSharedPref.setUser(
            res: x['user']['displayName']);
        await AuthLocalImplWithSharedPref.setToken(token: x['accessToken']);
        return loginResponse;
      }
      return LoginResponse();
    } catch (e) {
      throw ServerException();
    }}
    
  }




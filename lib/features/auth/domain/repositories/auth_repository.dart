import 'package:daily_leaves_task/features/auth/domain/usecases/login/login_params.dart';
import 'package:dartz/dartz.dart';


import '../../../../core/error/failures.dart';
import '../usecases/login/login_response.dart';

abstract class AuthRepository{
Future<Either<Failure,LoginResponse>> login(LoginParams? params);
} 
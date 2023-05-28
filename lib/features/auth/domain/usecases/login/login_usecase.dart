// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_leaves_task/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import 'package:daily_leaves_task/core/usecases/usecase.dart';
import 'package:daily_leaves_task/features/auth/domain/repositories/auth_repository.dart';
import 'package:daily_leaves_task/features/auth/domain/usecases/login/login_params.dart';
import 'package:daily_leaves_task/features/auth/domain/usecases/login/login_response.dart';

class LoginUseCase implements UseCase<LoginResponse,LoginParams> {
  final AuthRepository authRepository;
  LoginUseCase({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, Response>> call(LoginParams ?params) async{
    // TODO: implement call
    return await authRepository.login(params);
  }

}

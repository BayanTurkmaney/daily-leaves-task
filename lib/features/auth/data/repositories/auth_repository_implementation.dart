
import 'package:daily_leaves_task/features/auth/domain/usecases/login/login_params.dart';
import 'package:dartz/dartz.dart';
import 'package:daily_leaves_task/features/auth/data/data%20sources/auth_local_data_source.dart';
import 'package:daily_leaves_task/features/auth/data/data%20sources/auth_remote_data_source.dart';
import 'package:daily_leaves_task/features/auth/domain/repositories/auth_repository.dart';
import 'package:daily_leaves_task/features/auth/domain/usecases/login/login_response.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';

class AuthRepositoryImplementaion implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;
  NetworkInfo networkInfo;
  AuthRepositoryImplementaion({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, LoginResponse>> login(LoginParams? param) async {
    if (await networkInfo.isConnected) {
      try {
        final jsonEmployeeInfo = await authRemoteDataSource.login(param);

        return Right(jsonEmployeeInfo);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailue());
    }
  }
}

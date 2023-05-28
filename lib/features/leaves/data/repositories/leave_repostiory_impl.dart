// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_leaves_task/features/leaves/domain/usecases/getleavesCount/leaves_count_response.dart';
import 'package:daily_leaves_task/features/leaves/domain/usecases/getleavesCount/get_leaves_count.dart';
import 'package:dartz/dartz.dart';

import 'package:daily_leaves_task/core/error/failures.dart';
import 'package:daily_leaves_task/core/network/network_info.dart';
import 'package:daily_leaves_task/features/leaves/data/data%20sources/leave_remote_data_source.dart';
import 'package:daily_leaves_task/features/leaves/domain/repositories/leave_repository.dart';
import 'package:daily_leaves_task/features/leaves/domain/usecases/getAllLeaves/list_leave_reponse.dart';

import '../../../../core/error/exception.dart';
import '../../domain/usecases/getAllLeaves/get_all_leaves.dart';

class LeaveRepositoryImpl implements LeaveRepository {
  LeaveRemoteDataImplWithDio? leaveRemoteDataImplWithDio;
  NetworkInfo? networkInfo;
  LeaveRepositoryImpl({
    required this.leaveRemoteDataImplWithDio,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, ListLeaveResponse>> getAllLeaves(
      PageParam? param) async {
   
    if (await networkInfo!.isConnected) {
      try {
        final jsonLeavesList =
            await leaveRemoteDataImplWithDio!.getAllLeaves(param!);

        return Right(
            jsonLeavesList); //here will may be note that remotePosts type are PostModel, but the type of our function is Post, because PostModel extends Post, there is no probleme.
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(OfflineFailue());
  }

  @override
  Future<Either<Failure, LeavesCountResponse>> getLeavesCount(
      LeavesCountParam param) async {
    // TODO: implement getLeavesCount
    if (await networkInfo!.isConnected) {
      try {
        final jsonLeavesMap =
            await leaveRemoteDataImplWithDio!.getLeavesCount(param);

        return Right(
            jsonLeavesMap); //here will may be note that remotePosts type are PostModel, but the type of our function is Post, because PostModel extends Post, there is no probleme.
      } on ServerException {
        return Left(ServerFailure());
      } on NoNextPageException {
        return Left(NoNextPageFailure());
      }
    } else
      return Left(OfflineFailue());
  }
}
        //  await leaveRemoteDataImplWithDio!.getAllLeaves(PageParam);
        // return list1;



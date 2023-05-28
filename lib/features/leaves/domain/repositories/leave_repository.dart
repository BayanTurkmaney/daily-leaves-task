import 'package:daily_leaves_task/core/usecases/usecase.dart';
import 'package:daily_leaves_task/features/leaves/domain/usecases/getAllLeaves/get_all_leaves.dart';
import 'package:daily_leaves_task/features/leaves/domain/usecases/getAllLeaves/list_leave_reponse.dart';
import 'package:daily_leaves_task/features/leaves/domain/usecases/getleavesCount/get_leaves_count.dart';
import 'package:daily_leaves_task/features/leaves/domain/usecases/getleavesCount/leaves_count_response.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/leave.dart';

abstract class LeaveRepository{
  Future<Either<Failure,ListLeaveResponse>> getAllLeaves(PageParam? pageParam);
  Future<Either<Failure,LeavesCountResponse>> getLeavesCount(LeavesCountParam param);
}
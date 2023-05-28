// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_leaves_task/core/usecases/usecase.dart';
import 'package:daily_leaves_task/features/leaves/domain/usecases/getAllLeaves/list_leave_reponse.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../entities/leave.dart';
import '../../repositories/leave_repository.dart';

class GetAllLeavesUseCase implements UseCase<ListLeaveResponse,PageParam> {
  
  final LeaveRepository leaveRepository;
  GetAllLeavesUseCase({
    required this.leaveRepository,
  });

  @override
  Future<Either<Failure,ListLeaveResponse>> call(PageParam? pageParam) async{
    return await leaveRepository.getAllLeaves(pageParam);
  }
}

class PageParam implements Params {
  int? page;
  PageParam({
    this.page,
  });
  
  @override
  // TODO: implement data
  get data => [page];
}

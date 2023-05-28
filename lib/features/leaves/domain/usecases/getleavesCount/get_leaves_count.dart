
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../repositories/leave_repository.dart';
import '../getAllLeaves/list_leave_reponse.dart';
import 'leaves_count_response.dart';

class GetLeavesCountUseCase implements UseCase<LeavesCountResponse,LeavesCountParam> {
  
  final LeaveRepository leaveRepository;
  GetLeavesCountUseCase({
    required this.leaveRepository,
  });

  @override
  Future<Either<Failure,LeavesCountResponse>> call(LeavesCountParam param) async{
    return await leaveRepository.getLeavesCount(param);
  }
}

class LeavesCountParam implements Params {
  int? employeeId=6;
  LeavesCountParam({
    this.employeeId,
  });
  
  @override
  // TODO: implement data
  get data => [employeeId];
}
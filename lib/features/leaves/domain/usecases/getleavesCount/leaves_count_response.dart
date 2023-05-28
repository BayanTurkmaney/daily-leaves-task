import '../../../../../core/usecases/usecase.dart';

class LeavesCountResponse implements Response {
  final double? totalLeaves;
  final int? annualLeaves;
  LeavesCountResponse( {
  this.totalLeaves, this.annualLeaves,
  });
  
  @override
  // TODO: implement data
  get data => [totalLeaves,annualLeaves];
}

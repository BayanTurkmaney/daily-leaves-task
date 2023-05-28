// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_leaves_task/core/usecases/usecase.dart';
import 'package:daily_leaves_task/features/leaves/domain/entities/leave.dart';

class ListLeaveResponse implements Response {
  List<dynamic> leavesList;
  ListLeaveResponse({
    required this.leavesList,
  });
  
  @override
  // TODO: implement data
  get data => [leavesList];
}


class PaginationLeavesList implements Response{
  int? companyId;
  int? departmentId;
  int? employeeId;
  DateTime? fromDate;
  DateTime? toDate;
  List<dynamic>? leaves;
  int? pageNumber;
  int? totalPages;
  int? pageSize;
  int? totalSize;

  PaginationLeavesList(
      {this.companyId,
      this.departmentId,
      this.employeeId,
      this.fromDate,
      this.toDate,
      this.leaves,
      this.pageNumber,
      this.totalPages,
      this.pageSize,
      this.totalSize});
      
        @override
        // TODO: implement data
        get data => [
          companyId,
      departmentId,
      employeeId,
      fromDate,
      toDate,
      leaves,
      pageNumber,
      totalPages,
      pageSize,
      totalSize
        ];

}
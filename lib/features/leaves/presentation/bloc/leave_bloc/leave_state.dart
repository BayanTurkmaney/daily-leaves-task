// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'leave_bloc.dart';

abstract class LeaveState extends Equatable {
  const LeaveState();
  
  @override
  List<Object> get props => [];
}

class LeaveInitial extends LeaveState {}

class LeavesListLoaded extends LeaveState{
final List<LeaveModel> leaves;


  LeavesListLoaded({ required this.leaves});
    @override
  List<Object> get props => [leaves];
}


class LeavesListLoading extends LeaveState{
final List<LeaveModel> oldLeaves;
final bool isFirstFetch;

  LeavesListLoading({required this.oldLeaves,required this.isFirstFetch});
    @override
  List<Object> get props => [oldLeaves,isFirstFetch];
}

class FailureFetching extends LeaveState {
  String message;
  FailureFetching({
    required this.message,
  });
 @override
  List<Object> get props => [message];
}

class NoNextPageState extends LeaveState {
  String message;
  NoNextPageState({
    required this.message,
  });
 @override
  List<Object> get props => [message];
}



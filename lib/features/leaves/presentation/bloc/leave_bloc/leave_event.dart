part of 'leave_bloc.dart';

abstract class LeaveEvent extends Equatable {
  const LeaveEvent();

  @override
  List<Object> get props => [];
}

class FetchLeavesEvent implements LeaveEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];
  
  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}


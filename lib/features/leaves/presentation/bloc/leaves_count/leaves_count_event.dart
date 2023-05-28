part of 'leaves_count_bloc.dart';

abstract class LeavesCountEvent extends Equatable {
  const LeavesCountEvent();

  @override
  List<Object> get props => [];
}
class FetchLeavesCount implements LeavesCountEvent{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
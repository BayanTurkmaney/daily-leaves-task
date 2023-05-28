part of 'leaves_count_bloc.dart';

abstract class LeavesCountState extends Equatable {
  const LeavesCountState();
  
  @override
  List<Object> get props => [];
}

class LeavesCountInitial extends LeavesCountState {}
class LoadingMapState  extends LeavesCountState{
   const LoadingMapState();
  
  @override
  List<Object> get props => [];
}
class LeavesMapLoaded extends LeavesCountState{
final LeavesCountResponse leavesCount;
  LeavesMapLoaded({ required this.leavesCount});
    @override
  List<Object> get props => [leavesCount];
}

class FailureFetchingMap extends LeavesCountState {
  String message;
  FailureFetchingMap({
    required this.message,
  });
 @override
  List<Object> get props => [message];
}

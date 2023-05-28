import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{}

class OfflineFailue extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}

class ServerFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}


class NoNextPageFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
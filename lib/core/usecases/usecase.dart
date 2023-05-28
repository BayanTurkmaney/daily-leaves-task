import 'package:dartz/dartz.dart';
import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Response>> call(Params params);
}

class Params<T> {
  final T data;
  Params(this.data);
}


class NoParams {
  final void data;
  NoParams(this.data);
}


class Response<T> {
  final T data;
  Response(this.data);
}
class NoResponse {
  final void data;
  NoResponse(this.data);
}
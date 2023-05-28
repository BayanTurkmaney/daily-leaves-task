// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:daily_leaves_task/features/auth/domain/usecases/login/login_response.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:daily_leaves_task/features/auth/domain/usecases/login/login_params.dart';
import 'package:daily_leaves_task/features/auth/domain/usecases/login/login_usecase.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/strings/failures.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  LoginUseCase loginUseCase;
  AuthBloc(
    this.loginUseCase,
  ) : super(AuthInitial()) {
    on<LoginWithCredentialsPressedEvent>(_mapLoginWithCredentialsToState);
   on<TimeOut>(_mapTimeOutEventToState);
  }
  _mapTimeOutEventToState( TimeOut event, Emitter<AuthState>emit)async{
       emit(AutoLogOut());
  }
  _mapLoginWithCredentialsToState(
    LoginWithCredentialsPressedEvent event, Emitter<AuthState>emit
  ) async {
   
    // emit(LoadingState());
       final failureOrResponse= await loginUseCase(event.loginParams);
       
       emit(_mapFailureOrSuccessToState(failureOrResponse as Either<Failure,LoginResponse>));
  }

   AuthState _mapFailureOrSuccessToState(Either<Failure, LoginResponse> either) {
    return either.fold(
        (failure) => LoginFailure(message: _mapFailureToMessage(failure)),
        (responce) => LoginSucces());
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      
      case OfflineFailue:
        return OFFLINE_FAILURE_MESSAGE;

      default:
        return "Un expected Error, Please try again later .";
    }
  }
}

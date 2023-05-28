// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/strings/failures.dart';
import '../../../domain/usecases/getleavesCount/get_leaves_count.dart';
import '../../../domain/usecases/getleavesCount/leaves_count_response.dart';

part 'leaves_count_event.dart';
part 'leaves_count_state.dart';

class LeavesCountBloc extends Bloc<LeavesCountEvent, LeavesCountState> {
  GetLeavesCountUseCase getLeavesCountUseCase;
  LeavesCountBloc(
    this.getLeavesCountUseCase,
  ) : super(LeavesCountInitial()) {
    on<FetchLeavesCount>(_mapFetchLeavesCountEventToState);
  }

  _mapFetchLeavesCountEventToState(
      FetchLeavesCount event, Emitter<LeavesCountState> emit) async {
    emit(LoadingMapState());

    await getLeavesCountUseCase(LeavesCountParam(employeeId: 6)).then((value) {
      value.fold((l) => FailureFetchingMap(message: _mapFailureToMessage(l)),
          (r) {
        emit(LeavesMapLoaded(
            leavesCount: LeavesCountResponse(
                annualLeaves: r.annualLeaves, totalLeaves: r.totalLeaves)));
      });
    });
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

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:daily_leaves_task/core/error/exception.dart';
import 'package:daily_leaves_task/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:daily_leaves_task/features/leaves/domain/repositories/leave_repository.dart';
import 'package:daily_leaves_task/features/leaves/domain/usecases/getAllLeaves/get_all_leaves.dart';
import 'package:daily_leaves_task/features/leaves/domain/usecases/getAllLeaves/list_leave_reponse.dart';
import 'package:daily_leaves_task/features/leaves/domain/usecases/getleavesCount/leaves_count_response.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../../../../core/utils/strings/failures.dart';
import '../../../data/models/leave_model.dart';
import '../../../domain/entities/leave.dart';
import '../../../domain/usecases/getleavesCount/get_leaves_count.dart';

part 'leave_event.dart';
part 'leave_state.dart';

class LeaveBloc extends Bloc<LeaveEvent, LeaveState> {
  GetAllLeavesUseCase? getAllLeavesUseCase;
  NetworkInfo? networkInfo;
  LeaveBloc({
    this.getAllLeavesUseCase,
    this.networkInfo,
  }) : super(LeaveInitial()) {
    on<FetchLeavesEvent>(_mapFetchLeavesEventToState);
  }
  int page = 1;
  int countPages = 6;

  _mapFetchLeavesEventToState(
      FetchLeavesEvent event, Emitter<LeaveState> emit) async {
    if (await networkInfo!.isConnected) {
      if (page >= countPages) {
        emit(FailureFetching(message: NO_NEXT_PAGE));
        return;
        //  throw NoNextPageException();
      }

      if (state is LeavesListLoading) {
        return;
      }

      final currentState = state;

      var oldLeaves = <LeaveModel>[];
      if (currentState is LeavesListLoaded) {
        oldLeaves = currentState.leaves;
      }

      emit(LeavesListLoading(oldLeaves: oldLeaves, isFirstFetch: page == 1));

      await getAllLeavesUseCase!(PageParam(page: page)).then((newLeaves) {
        newLeaves.fold((l) => FailureFetching(message: _mapFailureToMessage(l)),
            (r) {
          page++;

          final leaves = (state as LeavesListLoading).oldLeaves;

          var l = leaves.addAll(r.leavesList
              .map((e) => LeaveModel(
                    notes: e.notes,
                    absenceFrom: e.absenceFrom,
                    absenceTo: e.absenceTo,
                    absenceValue: e.absenceValue,
                    employeeId: e.employeeId,
                    employeeName: e.employeeName,
                    id: e.id,
                    number: e.number,
                    statusId: e.statusId,
                    statusName: e.statusName,
                    typeId: e.typeId,
                  ))
              .toList());

          emit(LeavesListLoaded(leaves: leaves));
        });
      });
    } else
      emit(FailureFetching(message: OFFLINE_FAILURE_MESSAGE));
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

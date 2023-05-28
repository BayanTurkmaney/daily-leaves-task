import 'dart:async';

import 'package:daily_leaves_task/features/auth/data/data%20sources/auth_remote_data_source.dart';
import 'package:daily_leaves_task/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutoLogoutService {
  static Timer? _timer;
  static const autoLogoutTimer = 1;


  final AuthRemoteImplWithDio _authService = AuthRemoteImplWithDio();

  void startNewTimer(BuildContext context) {
    bool? isLoggedIn = _authService.isLoggedIn;

    stopTimer();
    if (isLoggedIn) {
      _timer = Timer.periodic(const Duration(minutes: 15), (_) {
        timedOut(context);
      });
    }
  }

  void stopTimer() {
    if (_timer != null || (_timer?.isActive != null && _timer!.isActive)) {
      _timer?.cancel();
    }
  }

  Future<void> timedOut(BuildContext context) async {
    stopTimer();
    if (_authService.isLoggedIn) {
      BlocProvider.of<AuthBloc>(context).add(TimeOut());
    }
  }
}

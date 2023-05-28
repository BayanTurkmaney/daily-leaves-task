import 'dart:async';

import 'package:daily_leaves_task/core/utils/snackbar_message.dart';
import 'package:daily_leaves_task/core/widgets/crclprgs.dart';
import 'package:daily_leaves_task/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:daily_leaves_task/features/auth/presentation/pages/login_page.dart';
import 'package:daily_leaves_task/features/leaves/domain/entities/leave.dart';
import 'package:daily_leaves_task/features/leaves/presentation/bloc/leave_bloc/leave_bloc.dart';
import 'package:daily_leaves_task/features/leaves/presentation/widgets/chart_bar.dart';
import 'package:daily_leaves_task/features/leaves/presentation/widgets/leave_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/services/auto_logout_service.dart';
import '../../../auth/data/data sources/auth_local_data_source.dart';
import '../../../auth/data/data sources/auth_remote_data_source.dart';
import '../bloc/leaves_count/leaves_count_bloc.dart';

class SecondPage extends StatefulWidget {
  SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final AutoLogoutService _autoLogoutService = AutoLogoutService();
  final AuthRemoteImplWithDio _authService = AuthRemoteImplWithDio();
  double? total;
  int? annual;
  String? name;
  @override
  void initState() {
    if (_authService.isLoggedIn) {
      _autoLogoutService.startNewTimer(context);
    }

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUserName();
  }

  getUserName() async {
    await AuthLocalImplWithSharedPref().getUser().then((value) => name = value);
  }

  final scrollController = ScrollController();

  

  String message = '';

  void setupScrollConter(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<LeaveBloc>(context).add(FetchLeavesEvent());
        }
      }
    });
  }

  bool isLoading = false;
  bool noData = false;
  
  @override
  Widget build(BuildContext context) {
    setupScrollConter(context);
    BlocProvider.of<LeaveBloc>(context).add(FetchLeavesEvent());
    BlocProvider.of<LeavesCountBloc>(context).add(FetchLeavesCount());
    return Scaffold(
      body: Column(
        children: [
          leavesBlocCountWidget(),
          Expanded(child: LeaveBlocWidget()),
        ],
      ),
    );
  }

  Widget leavesBlocCountWidget() {
    return BlocBuilder<LeavesCountBloc, LeavesCountState>(
        builder: (context, state) {
      if (state is LoadingMapState) {
        return Padding(
          padding: const EdgeInsets.only(top:50.0),
          child: CircleIndicator(),
        );
      }
      if (state is LeavesMapLoaded) {
        print(state.leavesCount.totalLeaves);
        print(state.leavesCount.annualLeaves);
        total = state.leavesCount.totalLeaves;
        annual = state.leavesCount.annualLeaves;
        return Stack(
          children: [
            Container(
              width: 1000,
              height: 150,
              child: SvgPicture.asset('assets/images/appbar.svg',
                  fit: BoxFit.fill, alignment: Alignment.topLeft),
            ),
            Positioned(
              top: 50,
              left: 70,
              child: ChartBar(
                name: name,
                annualOfTotal: annual,
                total: total,
              ),
            ),
          ],
        );
      }
      return Container();
    });
  }


  Widget LeaveBlocWidget() {
    return BlocConsumer<LeaveBloc, LeaveState>(
      listener: (context, state) {
         if (state is FailureFetching) {
          isLoading=false;
          SnackBarMessage()
                .ShowErrorSnackBar(message: state.message, context: context);

        }
      },
      builder: (context, state) {
       
        if (state is LeavesListLoading && state.isFirstFetch) {
          return Center(
            child: CircleIndicator(),
          );
        }
        List<Leave> leaves = [];

        if (state is LeavesListLoading) {
          leaves = state.oldLeaves;
          isLoading = true;
        } else if (state is LeavesListLoaded) {
          leaves = state.leaves;
        }
        return LeavesListWidgets(
            leaves: leaves,
            isLoading: isLoading,
            scrollController: scrollController,
            noData: noData,
            );
      },
    );
  }
}

class LeavesListWidgets extends StatelessWidget {
  const LeavesListWidgets({
    Key? key,
    required this.leaves,
    required this.isLoading,
    required this.scrollController,
    required this.noData,
  }) : super(key: key);

  final List<Leave> leaves;
  final bool isLoading;
  final bool noData;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: leaves.length + ((isLoading || noData) ? 1 : 0),
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < leaves.length)
            return LeaveWidget(
                typeId: leaves[index].typeId,
                from: leaves[index].absenceFrom,
                to: leaves[index].absenceTo,
                status: leaves[index].statusName,
                notes: leaves[index].notes);
          else {
            Timer(
              Duration(milliseconds: 30),
              () {
                scrollController
                    .jumpTo(scrollController.position.maxScrollExtent);
              },
            );

            return Center(
              child: CircleIndicator()
              
            );
          }
        });
  }
}

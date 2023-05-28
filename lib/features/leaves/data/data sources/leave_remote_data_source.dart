import 'dart:convert';

import 'package:daily_leaves_task/core/config/constants.dart';
import 'package:daily_leaves_task/core/error/exception.dart';
import 'package:daily_leaves_task/features/leaves/data/models/leave_model.dart';
import 'package:daily_leaves_task/features/leaves/domain/usecases/getleavesCount/get_leaves_count.dart';
import 'package:daily_leaves_task/features/leaves/domain/usecases/getleavesCount/leaves_count_response.dart';
import 'package:dio/dio.dart';

import '../../../auth/data/data sources/auth_local_data_source.dart';
import '../../domain/usecases/getAllLeaves/get_all_leaves.dart';
import '../../domain/usecases/getAllLeaves/list_leave_reponse.dart';

abstract class LeaveRemoteDataSource {}

class LeaveRemoteDataImplWithDio implements LeaveRemoteDataSource {
  List<dynamic> list = [];
  Map<String, dynamic> leavesMap = {};
  int totalLeaves = 0;
  Future<ListLeaveResponse> getAllLeaves(PageParam pageParam) async {
    String? token = await AuthLocalImplWithSharedPref.getToken();

    BaseOptions options = BaseOptions(
        headers: {
          'Content-type': 'application/json',
          'companyId': 1,
          'departmentId': 1,
          'employeeId': 6,
          'pageNumber': 1,
          'pageSize': 7,
          'Authorization': 'Bearer $token',
        },
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        receiveDataWhenStatusError: true);
    Dio dio = Dio(options);

    try {
      Response response =
          await dio.get('https://staging.api.hr-portals.com/api/v1/Leave/List');
      if (response.statusCode == 200) {
        var x = response.data;
        list = x['data']['leaves'];

        List<dynamic> leaves =
            x['data']['leaves'].map((e) => LeaveModel.fromJson(e)).toList();

        return ListLeaveResponse(leavesList: leaves);
      } else {
        return ListLeaveResponse(leavesList: []);
      }
    } catch (e) {
      throw ServerException();
    }
  }

  Future<LeavesCountResponse> getLeavesCount(LeavesCountParam param) async {
    String? token = await AuthLocalImplWithSharedPref.getToken();

    BaseOptions options = BaseOptions(
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        receiveDataWhenStatusError: true);
    Dio dio = Dio(options);
    try {
      Response response = await dio.get(
          'https://staging.api.hr-portals.com/api/v1/Employee/LeaveCount/6');
      if (response.statusCode == 200) {
        var x = response.data;
        leavesMap = x['data'];
        leavesMap.entries.forEach((entry) {});
        return LeavesCountResponse(
            annualLeaves: x['data']['annual'],
            totalLeaves: x['data']['maxAnnual']);
      } else {
        return LeavesCountResponse(annualLeaves: 0, totalLeaves: 0.0);
      }
    } catch (e) {
      throw ServerException();
    }
  }
}

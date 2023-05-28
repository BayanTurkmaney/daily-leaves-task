import 'package:daily_leaves_task/features/auth/data/models/employee_mdel.dart';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? displayName;
  final String username;
  final String email;
  final String? avatar;
  final bool? isActive;
  final List<String>? roles;
  final List<dynamic>? companys;
  final List<dynamic>? departments;
  final EmployeeModel? employee;

  User(
      {this.id,
      this.displayName,
      required this.username,
      required this.email,
      this.avatar,
      this.isActive,
      this.roles,
      this.companys,
      this.departments,
      this.employee});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        displayName,
        username,
        email,
        avatar,
        isActive,
        roles,
        companys,
        departments,
        employee
      ];
}

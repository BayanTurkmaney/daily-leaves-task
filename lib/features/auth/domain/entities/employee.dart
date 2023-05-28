import 'package:equatable/equatable.dart';

import 'company.dart';
import 'department.dart';

class Employee extends Equatable{
  final int? id;
  final String fullName;
  final String jobTitle;
  final String? machineEmployeeID;
  final int? basicSalary;
  final String? nationality;
  final String? birthDate;
  final String? mobile;
  final String email;
  final String? contract;
  final int? hiringTypeId;
  final String? hiringDate;
  final Company? company;
  final Department? department;
  final String? attendancePattern;

  Employee(
      {this.id,
      required this.fullName,
      required this.jobTitle,
      this.machineEmployeeID,
      this.basicSalary,
      this.nationality,
      this.birthDate,
      this.mobile,
      required this.email,
      this.contract,
      this.hiringTypeId,
      this.hiringDate,
      this.company,
      this.department,
      this.attendancePattern});
      
        @override
        // TODO: implement props
        List<Object?> get props =>[
          id,
          fullName,
          jobTitle,
          machineEmployeeID,
          basicSalary,
          nationality,
          birthDate,
          mobile,
          email,
          contract,
          hiringTypeId,
          hiringDate,
          company,
          department,
          attendancePattern
        ];


}

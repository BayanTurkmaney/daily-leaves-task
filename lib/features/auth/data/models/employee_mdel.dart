
import 'package:daily_leaves_task/features/auth/data/models/company_model.dart';
import 'package:daily_leaves_task/features/auth/data/models/department_model.dart';
import '../../domain/entities/employee.dart';

class EmployeeModel extends Employee{
  EmployeeModel({
    super.id,
   required  super.fullName,
   required  super.jobTitle,
    super.machineEmployeeID,
   super.basicSalary,
   super.nationality,
   super.birthDate,
   super.mobile,
   required super.email,
    super.contract,
    super.hiringTypeId,
    super.hiringDate,
   super.company,
    super.department,
    super.attendancePattern,});

     factory  EmployeeModel.fromJson(Map<String, dynamic> json) {
   return EmployeeModel( 
    id : json['id'],
    fullName : json['fullName'],
    jobTitle : json['jobTitle'],
    machineEmployeeID : json['machineEmployeeID'],
    basicSalary : json['basicSalary'],
    nationality : json['nationality'],
    birthDate : json['birthDate'],
    mobile : json['mobile'],
    email : json['email'],
    contract : json['contract'],
    hiringTypeId : json['hiringTypeId'],
    hiringDate : json['hiringDate'],
    company :
        json['company'] != null ? new CompanyModel.fromJson(json['company']) : null,
    department : json['department'] != null
        ? new DepartmentModel.fromJson(json['department'])
        : null,
    attendancePattern : json['attendancePattern'],);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] =id;
    data['fullName'] =fullName;
    data['jobTitle'] =jobTitle;
    data['machineEmployeeID'] =machineEmployeeID;
    data['basicSalary'] =basicSalary;
    data['nationality'] =nationality;
    data['birthDate'] =birthDate;
    data['mobile'] =mobile;
    data['email'] =email;
    data['contract'] =contract;
    data['hiringTypeId'] =hiringTypeId;
    data['hiringDate'] =hiringDate;
    if (this.company != null) {
      data['company'] =(this.company! as CompanyModel) .toJson();
    }
    if (this.department != null) {
      data['department'] =(this.department as DepartmentModel).toJson();
    }
    data['attendancePattern'] =attendancePattern;
    return data;
  }

}
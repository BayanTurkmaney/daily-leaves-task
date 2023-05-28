import 'package:daily_leaves_task/features/auth/domain/entities/department.dart';

class DepartmentModel extends Department{
  DepartmentModel({required String departmentName,  int? id, }) : 
  super(id: id, departmentName:departmentName );

 factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      id :json['id'] as int?,
    departmentName :json['departmentName'] as String);
  }

  Map<String, dynamic> toJson() {
    
   return {
   'id':id,
   'departmentName':departmentName
   };
    
  }
}
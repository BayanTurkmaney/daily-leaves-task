import '../../domain/entities/user.dart';
import 'company_model.dart';
import 'department_model.dart';
import 'employee_mdel.dart';

class UserModel extends User{
  UserModel({
     super.id,
     super.displayName,
         
        super.avatar,
         super.isActive,
         super.roles,
         super.companys,
           super.departments,
          super.employee,
    required super.username, required super.email}) ;
  
 factory UserModel.fromJson(Map<String, dynamic> json) {
  return UserModel(
    username:json['username'] ,
     email:json['email'],
      id :json['id'],
    displayName : json['displayName'],
   
    avatar : json['avatar'],
    isActive : json['isActive'],
    roles : json['roles'].cast<String>(),
    companys: json['companys']!=null? json['companys'].map((v) {
       CompanyModel.fromJson(v );
      }).toList() as List<CompanyModel> : json['companys']== []? [] as List<CompanyModel> :null,
    departments: json['departments'].map((v) {
       DepartmentModel.fromJson(v);
      }).toList() as List<DepartmentModel>,
   
    employee : json['employee'] != null
        ? new EmployeeModel.fromJson(json['employee'])
        : null
      );
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['displayName'] = this.displayName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['isActive'] = this.isActive;
    data['roles'] = this.roles;
    if (this.companys != null) {
      data['companys'] = this.companys!.map((v ) => (v as CompanyModel).toJson()).toList();
    }
    if (this.departments != null) {
      data['departments'] = this.departments!.map((v) =>(v as DepartmentModel).toJson()).toList();
    }
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    return data;
  }


}
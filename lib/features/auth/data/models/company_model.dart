import 'package:daily_leaves_task/features/auth/domain/entities/company.dart';

class CompanyModel extends Company{

  CompanyModel({
    required String companyName, 
    required String? businessType,
    int? id, String? logoUrl
    }):super(businessType: businessType!,companyName: companyName,id: id, logoUrl: logoUrl);

    
    factory CompanyModel.fromJson(Map<String, dynamic> json) {
   return CompanyModel(
    companyName: json['companyName'] as String, 
   businessType: json['businessType'] as String?,id: json['id'] as int?,
   logoUrl: json['logoUrl']as String?);
  }

  Map<String, dynamic> toJson() {
    return{
      'id':id,
      'companyName':companyName,
      'businessType':businessType,
      'logoUrl':logoUrl
    };
    
  }
  }
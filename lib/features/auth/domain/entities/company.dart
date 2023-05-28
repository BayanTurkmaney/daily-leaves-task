import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final int? id;
  final String companyName;
  final String businessType;
  final String? logoUrl;

  Company({this.id, required this.companyName,required this.businessType, this.logoUrl});
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    companyName,
    businessType,
    logoUrl
  ];
}


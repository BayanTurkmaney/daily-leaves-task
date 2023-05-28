import 'package:equatable/equatable.dart';

class Department extends Equatable{
  final int? id;
  final String departmentName;

  Department({this.id, required this.departmentName});
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    departmentName
  ];

  
}

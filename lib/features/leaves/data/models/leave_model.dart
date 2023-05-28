// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_leaves_task/features/leaves/domain/entities/leave.dart';
import 'package:date_format/date_format.dart';
class LeaveModel extends Leave {

  LeaveModel({
    super.absenceFrom,
     super.absenceTo,
    super.absenceValue,
    super.employeeId,
    super.employeeName,
    super.id,
    required super.notes,
    super.number,
    super.statusId,
    super.statusName,
    super.typeId,
  });


   LeaveModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    employeeName = json['employeeName']as String?;
    statusId = json['statusId'] as int?;
    statusName = json['statusName']as String?;
    absenceValue = json['absenceValue']as String?;
    number = json['number']as String?;
    employeeId = json['employeeId']as int?;
    typeId = json['typeId']as int?;
    absenceFrom = processDateTime(DateTime.parse(json['absenceFrom']));
    absenceTo = processDateTime(DateTime.parse(json['absenceTo']));
    notes = json['notes'] ?? 'No Notes';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employeeName'] = this.employeeName;
    data['statusId'] = this.statusId;
    data['statusName'] = this.statusName;
    data['absenceValue'] = this.absenceValue;
    data['number'] = this.number;
    data['employeeId'] = this.employeeId;
    data['typeId'] = this.typeId;
    data['absenceFrom'] = this.absenceFrom;
    data['absenceTo'] = this.absenceTo;
    data['notes'] = this.notes;
    return data;
  }

 String? processDateTime(DateTime uctDateTime){
   DateTime localDateTime = uctDateTime.toLocal();
   
  String formatDatedate = formatDate(localDateTime,[MM, ' ', dd, ',', yyyy]);
  
   return formatDatedate;
 }

 
}

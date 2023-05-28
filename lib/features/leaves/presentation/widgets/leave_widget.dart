import 'package:daily_leaves_task/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeaveWidget extends StatelessWidget {
   
  final String ?from;
  final String? to;
  final int? typeId;
  final String? status;
  final String? notes;
  String? leaveType;
  Map<int,String> leaveTypes={
    1:'annual',
    2:'Marriage',
    3:'Maternity',
    4:'Death',
    5:'unpaid',
    6:'sickness',
    7:'work accident',
    8:'others',
    9:'Maxannual',
    10:'hourly',
  };
  LeaveWidget({Key? key, this.from, this.to, this.status, this.notes, this.typeId, });
  @override
  Widget build(BuildContext context) {
    leaveType=leaveTypes.entries.firstWhere((element) => element.key==typeId).value;
    return Container(
      margin: EdgeInsets.all(10),
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40)
      ),
      child: Card(
        elevation: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title:Text('Applied Duration',
              style: Theme.of(context).textTheme.bodySmall!,
              ) ,
              subtitle: Text('$from to $to',style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorSystem.black,fontWeight: FontWeight.w100),),
              leading: SvgPicture.asset('assets/images/date.svg'),
            ),
            ListTile(
              title:Text('Types of Leave', style: Theme.of(context).textTheme.bodySmall!,) ,
              subtitle: Text('$leaveType',style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorSystem.black,fontWeight: FontWeight.w100),),
              leading: SvgPicture.asset('assets/images/work.svg'),
            ),
            ListTile(
              title:Text('Notes',style: Theme.of(context).textTheme.bodySmall,) ,
              subtitle: Text('$notes ',style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorSystem.black,fontWeight: FontWeight.w100),),
              leading: SvgPicture.asset('assets/images/reason.svg'),
            ),
            ListTile(
              title:Text('Status',style: Theme.of(context).textTheme.bodySmall,) ,
              subtitle: Text('$status',style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorSystem.black,fontWeight: FontWeight.w100),),
              leading: SvgPicture.asset('assets/images/date.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
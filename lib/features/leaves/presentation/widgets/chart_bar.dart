import 'package:daily_leaves_task/core/utils/styles.dart';
import 'package:daily_leaves_task/core/widgets/vertical_box.dart';
import 'package:daily_leaves_task/features/auth/data/data%20sources/auth_local_data_source.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final double? total;
  final int? annualOfTotal;
  final String? name;
 
  ChartBar({ this.total, this.annualOfTotal, this.name});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 20,
          child: FittedBox(
            child: Text(name! ?? 'No Name',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorSystem.whiteColor),),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 8,
          width: 250,
          decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 241, 236, 236), width: 1.0),
                  color: Color.fromRGBO(241, 240, 240, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorSystem.rememberMeColor, width: 1.0),
                  color: Color.fromRGBO(189, 188, 188, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                // heightFactor: 200,
                widthFactor: annualOfTotal!/total!,
                child: Container(
                  decoration: BoxDecoration(
                    color:Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              
            ],
          ),

        ),
       VerticalBox(height: 5,),
        Container(
                width: 250,
               padding: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('annual $annualOfTotal',style: Theme.of(context).textTheme.bodySmall!.copyWith(color:ColorSystem.whiteColor,fontSize: 10.0),),
                                Text('Max Annual $total',style: Theme.of(context).textTheme.bodySmall!.copyWith(color:ColorSystem.whiteColor,fontSize: 10.0),)
                              ],
                            ),
              )
    
      ],
    );
  }
}

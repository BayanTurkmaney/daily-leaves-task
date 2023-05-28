import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VerticalBox extends StatelessWidget {
   VerticalBox({super.key, this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height,);
  }
}
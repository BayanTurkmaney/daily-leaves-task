// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:daily_leaves_task/core/utils/styles.dart';

class FormTextWidget extends StatelessWidget {
  FormTextWidget({
    Key? key,
    this.onSaved,
    this.validator,
    this.isObsecure,
    required this.controller,
  }) : super(key: key);
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool? isObsecure;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 50,
      child: TextFormField(
                  onSaved: onSaved,
                  validator: validator,
                  decoration: InputDecoration(
                    
                    filled: true,
                    suffixIcon: isObsecure! ? Icon(Icons.remove_red_eye,color: ColorSystem.purple,):null,
                    enabledBorder:OutlineInputBorder(
                       borderRadius: BorderRadius.circular(50), 
                         borderSide: const BorderSide(
                          color: Colors.white
                        )
                        ) ,
                    focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20), 
                        borderSide:  BorderSide(
                          color: ColorSystem.purple,
                        ) ),
                    fillColor: Colors.white,
                    border: InputBorder.none,
                  
                  ),
                ),
    );
  }
}

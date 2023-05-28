import 'package:daily_leaves_task/core/utils/styles.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    primaryColor: Colors.green,
    primarySwatch: Colors.grey,
    textTheme: textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
    ));
TextTheme textTheme = TextTheme(
  bodyLarge: TextStyle(
      color: ColorSystem.pleaseLogInColor, fontSize: 24, fontFamily: 'Cairo'),
  bodyMedium: TextStyle(
      color: ColorSystem.pleaseLogInColor, fontSize: 18, fontFamily: 'Cairo'),
  bodySmall: TextStyle(
      color: ColorSystem.rememberMeColor, fontSize: 15, fontFamily: 'Cairo'),
);

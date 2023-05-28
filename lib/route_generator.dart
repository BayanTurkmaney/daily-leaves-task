import 'package:daily_leaves_task/features/auth/presentation/pages/login_page.dart';
import 'package:daily_leaves_task/features/leaves/presentation/pages/leaves.dart';
import 'package:flutter/material.dart';



class RouteGenerator {

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => LoginPage());
      case '/leaves':
         print('GGGGGGGGGGGGGGGGGGGGGGGG');
         return MaterialPageRoute(builder: (context) => SecondPage());

      default:
        return MaterialPageRoute(builder: (context) => Scaffold(
          body: Center(
            child: Text("Not found ${settings.name}"),
          ),
        ));
    }
  }
}
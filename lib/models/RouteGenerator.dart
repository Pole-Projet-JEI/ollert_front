import 'package:flutter/material.dart';
import 'package:ollert/screens/TaskDescription.dart';
import 'package:ollert/screens/TaskPage.dart';
import 'package:ollert/models/Task.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Task ;
    switch (settings.name) {
         case '/':
        return MaterialPageRoute(builder: (_) => TaskPage());
      default:
        return MaterialPageRoute(builder: (_) => TaskDescription(args));
    
    }

  }
}
import 'package:flutter/material.dart';
import 'package:ollert/screens/AddProject.dart';
import 'package:ollert/screens/AddTask.dart';
import 'package:ollert/screens/TaskPage.dart';
import 'package:ollert/screens/showTask.dart';
import 'package:ollert/screens/signIn.dart';
import 'package:ollert/screens/projectsPage.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/projects": (context)=>LogoutPage(),
        "/AddProject": (context)=>AddProject(),
        "/AddTask": (context)=>AddTask(),
        "/TaskPage": (context)=>TaskPage(),
        "/ShowTask": (context)=>ShowTask(),

      },
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),

    );
  }
}
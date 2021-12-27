import 'package:flutter/material.dart';
import 'package:ollert/screens/AddProject.dart';
import 'package:ollert/screens/signIn.dart';
import 'package:ollert/screens/signOut.dart';
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
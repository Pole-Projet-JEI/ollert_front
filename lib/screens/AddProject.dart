import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddProject extends StatelessWidget {
  const AddProject({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return SafeArea(child:
     Scaffold(
       appBar:  AppBar (  title: Text("Add new Project"),
          centerTitle: true,
        ),));
  }
}
import 'package:flutter/material.dart';
import 'package:ollert/screens/Doing.dart';
import 'package:ollert/screens/Done.dart';
import 'package:ollert/screens/TaskPage.dart';
Widget taskState(context) => Row( 
  crossAxisAlignment: CrossAxisAlignment.start, 
  mainAxisAlignment: MainAxisAlignment.spaceBetween,

  children:<Widget> [ 
  ElevatedButton(onPressed:(){Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => TaskPage()),
  );},style: raisedButtonStyle, 
  child: Text(" To do")),
  ElevatedButton(onPressed:(){ Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Doing()),
  );}, style: raisedButtonStyle, 
  child: Text("Doing")),
  ElevatedButton(onPressed:(){
     Navigator.push(context,MaterialPageRoute(builder: (context) => Done()),
  );}, style: raisedButtonStyle, 
  child: Text("Done")),
  ]
);
final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Colors.green.shade300,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);
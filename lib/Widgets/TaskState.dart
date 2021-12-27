import 'package:flutter/material.dart';
Widget taskState() => Row( 
  crossAxisAlignment: CrossAxisAlignment.start, 
  mainAxisAlignment: MainAxisAlignment.spaceBetween,

  children:<Widget> [ 
  ElevatedButton(onPressed:(){},style: raisedButtonStyle, 
  child: Text(" To do")),
  ElevatedButton(onPressed:(){}, style: raisedButtonStyle, 
  child: Text("Doing")),
  ElevatedButton(onPressed:(){}, style: raisedButtonStyle, 
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
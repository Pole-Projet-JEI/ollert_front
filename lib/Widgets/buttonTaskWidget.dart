import 'package:flutter/material.dart';
import 'package:ollert/models/Task.dart';
import 'package:ollert/screens/TaskDescription.dart';
Widget buttonTaskWidget(context,String s,String s3,Task task1)=> Column( children :<Widget>[
  ElevatedButton(onPressed:(){
        Navigator.of(context).pushNamed(s3,arguments:task1 );}
  ,style: raisedButtonStyle, 
  child: Text(s)),]
);
final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Colors.purple.shade200,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 100),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);
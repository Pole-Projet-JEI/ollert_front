import 'package:flutter/material.dart';
import 'package:ollert/screens/TaskDescription.dart';
Widget buttonTaskWidget(context,String s)=> Column( children :<Widget>[
  ElevatedButton(onPressed:(){
     Navigator.push( context,
    MaterialPageRoute(builder: (context) => TaskDescription()),
  );
  },style: raisedButtonStyle, 
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

import 'package:flutter/material.dart';
import 'package:ollert/screens/AddTask.dart';

Widget Button (context) =>
 FloatingActionButton(
              
              onPressed: (){
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AddTask()),
  );
              },
              child: Text(
                "ADD", 
              ),
backgroundColor: Colors.green.shade300,
            );
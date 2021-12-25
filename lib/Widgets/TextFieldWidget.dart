import 'package:flutter/material.dart';
Widget textfieldwidget(String s,TextEditingController s2) => Column(
  crossAxisAlignment: CrossAxisAlignment.start, 
  children: [ 
    Text( 
      s,
      style: TextStyle(color : Colors.brown.shade50,
        fontWeight: FontWeight.bold,fontSize: 20),

    ),
    const SizedBox(height:5),
    TextFormField(
     controller: s2,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  
                  ),
                ),

    
  ],

);
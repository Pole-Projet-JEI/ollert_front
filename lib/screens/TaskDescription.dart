import 'package:flutter/material.dart';
import 'package:ollert/Widgets/TaskWidget.dart';
import 'package:ollert/screens/TaskPage.dart';
import 'package:ollert/Widgets/buttonTaskWidget.dart';
import 'package:ollert/models/Task.dart';

class TaskDescription extends StatelessWidget {
  //const TaskDescription({ Key? key }) : super(key: key);
        static const String route = '/details';
Task task1;
  TaskDescription(this.task1);

  @override
  Widget build(BuildContext context) {
final topPadding = MediaQuery.of(context).padding.top;
    return SafeArea(
      child : Scaffold(
        body:Container(
      
         height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff40C7DA), Color(0xff398AA3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      child: SingleChildScrollView(
          child: Column(
          children: [
            SizedBox(height: topPadding),
            SizedBox(height: 5),
            Row(
              children: [
                    IconButton(
                    onPressed: (){  Navigator.pop(context);},
                    icon: const Icon(
                      Icons.keyboard_arrow_left_rounded ,
                      size: 25,
                    )),
                const Text(
                        "       Task Description",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                   
              ],
            ),
                  TaskWidget(task1: task1),
            
                
                  
      
          ],
          )
        ,),
        )
        ),
        );
            
  
  }
     
}
 
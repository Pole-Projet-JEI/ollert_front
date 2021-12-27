import 'package:flutter/material.dart';
import 'package:ollert/Widgets/buttonTaskWidget.dart';
import 'package:ollert/models/Task.dart';
import 'package:ollert/Widgets/TaskState.dart';
import 'package:ollert/Widgets/TaskWidget.dart';



import 'package:ollert/Widgets/projectWidget.dart';
class TaskPage extends StatelessWidget {
   TaskPage({ Key? key }) : super(key: key);
  Task task1 = new Task(
    name:'Create the ADD Page in dart',
    id: 1,
     project:'project1',
    description: ' you should create a new branch sprint1/ADDPage and then write your code',
        deadline: "13/02/2022",
        state:'doing');
         

  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
          body: Stack(
            alignment:AlignmentDirectional.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
           alignment: Alignment.topLeft,
           height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff40C7DA), Color(0xff398AA3)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 20,
                ),
               IconButton(
                    onPressed: (){},
                    icon: const Icon(
                      Icons.keyboard_arrow_left_rounded ,
                      size: 25,
                    )),
                const Text(
                  "         Tasks",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(width: 20,),
              ]
            ),        
       ),
      Positioned(top: 80, child:  Container(child:
       taskState(),
          ),
         ),
         Positioned(top:150 ,child: buttonTaskWidget(context,"Task1"))
         
         
         ]
      ))
      
        );
  
  }
}
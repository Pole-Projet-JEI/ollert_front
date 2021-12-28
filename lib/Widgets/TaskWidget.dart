import 'package:flutter/material.dart';
import 'package:ollert/models/task.dart';
class TaskWidget extends StatelessWidget {
  Task? task1;
  TaskWidget({required this.task1 });
  @override
  Widget build(BuildContext context) { return
 Container(
    
   child: 
   ElevatedButton(onPressed: (){}, child: Container(
      
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width*0.9,
      
       decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.purple,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(5, 3), // changes position of shadow
            ),
          ],
            color:Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(100))),
            
            child: Column(   children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [  Text("${task1?.name}" ,style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,)),
                     Text("${task1?.deadline}",style:const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,)),
              ]  ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              
     Text("${task1?.description}",style: const TextStyle( fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,)),
            
              ]
            )
            )),
 );}}
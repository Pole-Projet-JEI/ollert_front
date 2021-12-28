import 'package:flutter/material.dart';
import 'package:ollert/Service/tasksServices.dart';
import 'package:ollert/models/project.dart';
import 'package:ollert/models/task.dart';
import 'package:ollert/screens/projectsPage.dart';


class buttonTaskWidget extends StatefulWidget {
  int? state;
  Task task;
  double? width;
  Project? project;
  void Function(int) onConfirm ;
  buttonTaskWidget({Key? key,required this.onConfirm,required this.state, required this.task,this.width,required this.project}) : super(key: key);

  @override
  State<buttonTaskWidget> createState() => _buttonTaskWidgetState();
}

class _buttonTaskWidgetState extends State<buttonTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/ShowTask", arguments: {"task":widget.task,"project":widget.project});
        },
        onLongPress: ()async{
          return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding: const EdgeInsets.all(20),
                actionsPadding:
                const EdgeInsets.only(bottom: 24),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(20.0))),
                title: const Text(
                  "Changement d'état d'une tâche",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                content:  Text(
                  "Veuillez choisir un état auquel vous allez déplacer la tâche \"${widget.task.name}\"",
                  textAlign: TextAlign.center,
                ),
                actions: <Widget>[
                 Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           if(widget.state!=0)
                           Container(
                             height:40,
                             decoration: BoxDecoration(
                               borderRadius:
                               BorderRadius.circular(20),
                               gradient: const LinearGradient(
                                 colors: [
                                   Color(0xffde4526),
                                   Color(0xfff78d4a)
                                 ],
                                 begin: Alignment.topLeft,
                                 end: Alignment.bottomRight,
                               ),
                             ),
                             child: FlatButton(
                               minWidth: MediaQuery.of(context)
                                   .size
                                   .width *
                                   0.33,
                               onPressed: () async {
                                 await TasksServices().changeTaskState(widget.task.id??0,"todo");
                                   widget.onConfirm(widget.state??0);
                                 Navigator.of(context).pop();
                               },
                               textColor: Colors.black54,
                               child: const Center(
                                 child: Text(
                                   "A faire",
                                   style: TextStyle(
                                     color: Colors.white,
                                     fontSize: 14.0,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                           if(widget.state!=1)
                           Container(
                             height:40,
                             decoration: BoxDecoration(
                               borderRadius:
                               BorderRadius.circular(20),
                               gradient: const LinearGradient(
                                 colors: [
                                   Color(0xffde4526),
                                   Color(0xfff78d4a)
                                 ],
                                 begin: Alignment.topLeft,
                                 end: Alignment.bottomRight,
                               ),
                             ),
                             child: FlatButton(
                               minWidth: MediaQuery.of(context)
                                   .size
                                   .width *
                                   0.33,
                               onPressed: () async {
                                 await TasksServices().changeTaskState(widget.task.id??0,"doing");
                                   widget.onConfirm(widget.state??0);
                                 Navigator.of(context).pop();
                               },
                               textColor: Colors.black54,
                               child: const Center(
                                 child: Text(
                                   "En cours",
                                   style: TextStyle(
                                     color: Colors.white,
                                     fontSize: 14.0,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                           if(widget.state!=2)
                             Container(
                             height:40,
                             decoration: BoxDecoration(
                               borderRadius:
                               BorderRadius.circular(20),
                               gradient: const LinearGradient(
                                 colors: [
                                   Color(0xffde4526),
                                   Color(0xfff78d4a)
                                 ],
                                 begin: Alignment.topLeft,
                                 end: Alignment.bottomRight,
                               ),
                             ),
                             child: FlatButton(
                               minWidth: MediaQuery.of(context)
                                   .size
                                   .width *
                                   0.33,
                               onPressed: () async {
                                 await TasksServices().changeTaskState(widget.task.id??0,"done");
                                   widget.onConfirm(widget.state??0);
                                 Navigator.of(context).pop(widget.state);
                               },
                               textColor: Colors.black54,
                               child: const Center(
                                 child: Text(
                                   "Fait",
                                   style: TextStyle(
                                     color: Colors.white,
                                     fontSize: 14.0,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                     const SizedBox(height: 10,),
                     Container(
                       height:40,

                       width:MediaQuery.of(context)
                           .size
                           .width *
                           0.7 ,
                       decoration: BoxDecoration(
                         borderRadius:
                         BorderRadius.circular(20),
                         gradient:  LinearGradient(
                           colors: [
                             Colors.green.shade400,
                             Colors.lightGreen.shade400
                           ],
                           begin: Alignment.topLeft,
                           end: Alignment.bottomRight,
                         ),
                       ),
                       child: FlatButton(
                         minWidth: MediaQuery.of(context)
                             .size
                             .width *
                             0.5,
                         onPressed: () async {
                           setState(() {});
                           Navigator.of(context).pop();
                         },
                         textColor: Colors.black54,
                         child: const Center(
                           child: Text(
                             "Annuler",
                             style: TextStyle(
                               color: Colors.white,
                               fontSize: 14.0,
                             ),
                           ),
                         ),
                       ),
                     ),
                   ],
                 )
                ],
              );
            },
          );

        },
        style: ElevatedButton.styleFrom(
          fixedSize:  Size(widget.width??350,0),
          primary: Colors.black45,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        child: Text(widget.task.name??""));
  }
}



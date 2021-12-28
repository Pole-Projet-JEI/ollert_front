// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:ollert/Widgets/buttonTaskWidget.dart';
import 'package:ollert/models/task.dart';

class TaskPage extends StatelessWidget {
  static const String route = '/';

  Task task = Task(
      name: 'Create the ADD Page in dart',
      id: 1,
      id_project: 5,
      description:
          'Use the task topic to describe the steps of a particular task, or to provide an overview of a higher-level task. The task topic includes sections for describing the context, prerequisites, actual steps, expected results, example, and expected next steps for a task.',
      deadline: "13/02/2022",
      id_state: 1);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 25),
                    alignment: Alignment.topCenter,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff40C7DA), Color(0xff398AA3)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child:
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 25,
                          )),
                      const Text(
                        "Tasks",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                    ]),
                  ),
                  Positioned(
                    top: 120,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.green.shade400.withOpacity(0.8),
                                Colors.green.shade400
                              ],
                            ),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: FlatButton(
                                    onPressed: () {},
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15)),
                                      ),
                                      child: Center(child: Text("A faire")),
                                    )),
                              ),
                              VerticalDivider(
                                color: Colors.black,
                              ),
                              Expanded(
                                child: FlatButton(
                                    onPressed: () {},
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15)),
                                      ),
                                      child: Center(child: Text("En cours")),
                                    )),
                              ),
                              VerticalDivider(
                                color: Colors.black,
                              ),
                              Expanded(
                                child: FlatButton(
                                    onPressed: () {},
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15)),
                                      ),
                                      child: Center(child: Text("Fait")),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:20 ,),
                        buttonTaskWidget(task: task,width: MediaQuery.of(context).size.width * 0.9,),
                        SizedBox(height:0 ,),
                        buttonTaskWidget(task: task,width: MediaQuery.of(context).size.width * 0.9,),
                      ],
                    ),
                  )
    ]
            ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green.shade400,
            child: Icon(Icons.add,color: Colors.black45,),
            onPressed: (){
              Navigator.of(context).pushNamed("/AddTask");
            },
          ),
        )
    );
  }
}

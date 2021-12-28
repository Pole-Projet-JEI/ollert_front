// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ollert/Service/authServices.dart';
import 'package:ollert/Widgets/buttonTaskWidget.dart';
import 'package:ollert/models/project.dart';
import 'package:ollert/models/task.dart';
import 'package:ollert/Service/tasksServices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskPage extends StatefulWidget {

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {


  bool? isManager;
  Widget? floating;

  Future <Widget> getFloating() async
  {
    SharedPreferences sp= await SharedPreferences.getInstance();
    setState(() {
      isManager=sp.getBool("isManager");
    });
    if(isManager==true)
    {
      return FloatingActionButton(
        backgroundColor: Colors.green.shade400,
        child: Icon(Icons.add,color: Colors.black45,),
        onPressed: (){
          Navigator.of(context).pushNamed("/AddTask",arguments: project?.id);
        },
      );
    }
    return Container();
  }

  @override
  void initState() {
    super.initState();
    getFloating().then((value) => floating=value);
  }
  Project? project;


  int state=0;


  @override
  Widget build(BuildContext context) {
    project = ModalRoute.of(context)?.settings.arguments as Project ;
    return SafeArea(
        child: Scaffold(
            body: Stack(alignment: AlignmentDirectional.bottomCenter,
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
                        "Tâches",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      IconButton(
                              onPressed: () async {
                                await AuthService().SingOut().then((value) {
                                  if (value) {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil("/", (route) => false);
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.logout,
                                size: 25,
                              ))
                    ]),
                  ),
                  Positioned(
                    top: 120,
                    child: Container(
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
                                onPressed: () {
                                  setState(() {
                                    state=0;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15)),
                                  ),
                                  child: Center(child: Text("A faire",style:TextStyle(
                                      color: state==0?Colors.white70:Colors.black87
                                  ))),
                                )),
                          ),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          Expanded(
                            child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    state=1;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15)),
                                  ),
                                  child: Center(child: Text("En cours",style:TextStyle(
                                      color: state==1?Colors.white70:Colors.black87
                                  ))),
                                )),
                          ),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          Expanded(
                            child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    state=2;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15)),
                                  ),
                                  child: Center(child: Text("Fait",style:TextStyle(
                                      color: state==2?Colors.white70:Colors.black87
                                  ))),
                                )),
                          ),
                        ],
                      ),
                    )
                  ),
                  Positioned(
                    top: 190,
                    child: Column(
                      children: [
                        Text("Appuier longtement pour changer d'état",
                          style: TextStyle(
                              color: Colors.grey.shade300,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        if(isManager==true)
                        Column(
                          children: [
                            SizedBox(height: 10,),
                            Text("Balayer vers la droite pour supprimer ",
                              style: TextStyle(
                                  color: Colors.red.shade300,
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                          ],
                        )
                      ],
                    )
                  ),
                  Container(
                    width:MediaQuery.of(context).size.width*0.9 ,
                    height: MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?MediaQuery.of(context).size.height * 0.6:MediaQuery.of(context).size.height*0.2,
                    child: FutureBuilder<List<Task>>(
                        future: state==0?TasksServices().getTasks(project?.id??0,"todo"):state==1?TasksServices().getTasks(project?.id??0,"doing"):TasksServices().getTasks(project?.id??0,"done"),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done) {
                            return const SpinKitPouringHourGlassRefined(
                              color: Colors.white60,
                              size: 60.0,
                            );
                          }
                          if (snapshot.hasError) {
                          }
                          if(snapshot.hasData)
                            {
                              bool isEmpty = snapshot.data?.isEmpty ?? true;
                              if(isEmpty)
                                {
                                  String addState =(state==0)?"à faire":(state==1)?"en cours":"faites";
                                  return Center(
                                      child: Text("Pas de tâches "+addState));
                                }
                            }
                          List<Task> tasks = snapshot.data ?? [];
                          return ListView.builder(
                              itemCount: tasks.length,
                              itemBuilder: (context, index) {
                                Task task = tasks[index];
                                return Dismissible(
                                  direction: (isManager==true)?DismissDirection.startToEnd:DismissDirection.none,
                                  key: UniqueKey(),
                                  child: buttonTaskWidget(task: task,project: project,state:state,onConfirm: (val){
                                    setState(() {
                                      state=val;
                                    });
                                  },),
                                  confirmDismiss: (DismissDirection direction) async {
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
                                            "Confirmer la suppression",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          content: const Text(
                                            "Etes-vous sûr de vouloir supprimer cette tâche?",
                                            textAlign: TextAlign.center,
                                          ),
                                          actions: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                      0.05,
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
                                                      await TasksServices().deleteTask(task.id);
                                                      setState(() {});
                                                      Navigator.of(context).pop();
                                                    },
                                                    textColor: Colors.black54,
                                                    child: const Center(
                                                      child: Text(
                                                        "Supprimer",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                      0.05,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(20),
                                                    gradient: const LinearGradient(
                                                      colors: [
                                                        Color(0xff219138),
                                                        Color(0xff1fc441)
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
                                                    onPressed: () => setState(() {
                                                      Navigator.of(context).pop();
                                                    }),
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
                                                )
                                              ],
                                            )
                                          ],
                                        );
                                      },
                                    );
                                  },
                                );
                              });
                        }),
                  ),
    ]
            ),
          floatingActionButton: floating,
        )
    );
  }
}

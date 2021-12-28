// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ollert/Service/authServices.dart';
import 'package:ollert/Service/projectServices.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/projectWidget.dart';
import 'package:ollert/models/project.dart';

class LogoutPage extends StatefulWidget {
  @override
  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  bool? isManager;
  Widget? floating;

  Future <Widget> getFloating() async
  {
    SharedPreferences sp= await SharedPreferences.getInstance();
    isManager=sp.getBool("isManager");
    if(isManager==true)
      {
        return FloatingActionButton(
          backgroundColor: Colors.black87,
          child:const  Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.of(context).pushNamed("/AddProject");
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
            alignment:AlignmentDirectional.bottomEnd,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      "Projets",
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
                  ],
                ),
                if(isManager==true)
                  Column(
                    children: [
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Balayer vers la droite pour supprimer",style: TextStyle(
                            color: Colors.red.shade300,
                            fontWeight: FontWeight.bold
                        ),),
                      )
                    ],
                  )

              ],
            )
          ),
          Container(
            height: MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?MediaQuery.of(context).size.height * 0.8:MediaQuery.of(context).size.height*0.5,
            child: FutureBuilder<List<Project>>(
                future: ProjectServices().getProjects(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const SpinKitPouringHourGlassRefined(
                      color: Colors.white60,
                      size: 60.0,
                    );
                  }
                  if (snapshot.hasError) {
                    // return: show error widget
                  }
                  if(snapshot.hasData)
                  {
                    bool isEmpty = snapshot.data?.isEmpty ?? true;
                    if(isEmpty)
                    {
                      return Center(
                          child: Text("Pas de projets"));
                    }
                  }
                  List<Project> projects = snapshot.data ?? [];
                  return ListView.builder(
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        Project project = projects[index];
                        return Dismissible(
                          direction: (isManager==true)?DismissDirection.startToEnd:DismissDirection.none,
                          key: UniqueKey(),
                          child: ProjectWidget(project: project),
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
                                    "Etes-vous sûr de vouloir supprimer ce projet?",
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
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
                                              await ProjectServices()
                                                  .deleteProject(project.id);
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
                                          height:40,
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
        ],
      ),
          floatingActionButton: floating,
      ),
    );
  }
}

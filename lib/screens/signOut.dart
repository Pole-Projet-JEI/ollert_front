import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Widgets/projectWidget.dart';
import 'package:ollert/models/Project.dart';
import 'package:ollert/screens/AddProject.dart';
import 'package:ollert/screens/signIn.dart';

class LogoutPage extends StatefulWidget {
  @override
  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {

    List<Project> projects = [
      Project(id:1,name:"projet 1",type:"IT",description:"Résultat de recherche d'images pour description projet. La description du projet est une déclaration écrite formelle du projet, de son idée et de son contexte, qui explique les buts et les objectifs à atteindre, le besoin commercial et le problème à résoudre, les pièges et les défis potentiels, les approches et les méthodes d'exécution, les estimations des ressources",
      deadline: DateTime(2021,12,29),idManager: 1), Project(id:1,name:"projet 1",type:"IT",description:"Résultat de recherche d'images pour description projet. La description du projet est une déclaration écrite formelle du projet, de son idée et de son contexte, qui explique les buts et les objectifs à atteindre, le besoin commercial et le problème à résoudre, les pièges et les défis potentiels, les approches et les méthodes d'exécution, les estimations des ressources",
      deadline: DateTime(2021,12,29),idManager: 1), Project(id:1,name:"projet 1",type:"IT",description:"Résultat de recherche d'images pour description projet. La description du projet est une déclaration écrite formelle du projet, de son idée et de son contexte, qui explique les buts et les objectifs à atteindre, le besoin commercial et le problème à résoudre, les pièges et les défis potentiels, les approches et les méthodes d'exécution, les estimations des ressources",
      deadline: DateTime(2021,12,29),idManager: 1),Project(id:1,name:"projet 1",type:"IT",description:"Résultat de recherche d'images pour description projet. La description du projet est une déclaration écrite formelle du projet, de son idée et de son contexte, qui explique les buts et les objectifs à atteindre, le besoin commercial et le problème à résoudre, les pièges et les défis potentiels, les approches et les méthodes d'exécution, les estimations des ressources",
      deadline: DateTime(2021,12,29),idManager: 1),
    ];


    return SafeArea(
        child:Scaffold
      (
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
            children:  [
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, icon: const Icon(
                    Icons.arrow_back,
                    size: 25,
                  )),
                  const Text(
                    "Projects",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  IconButton(onPressed:(){}, icon: const Icon(
                    Icons.logout,
                    size: 25,
                  ))

                ],
              ),
              const SizedBox(height: 50,),
              ProjectWidget(project: projects[0]),
              ProjectWidget(project: projects[0]),
              ProjectWidget(project: projects[0]),
              ProjectWidget(project: projects[0]),
              ProjectWidget(project: projects[0]),
            ],
          ),
        )
      ) ,
    ));
  }
}
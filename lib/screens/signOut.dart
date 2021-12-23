import 'package:flutter/material.dart';
import 'package:ollert/Service/authServices.dart';
import 'package:ollert/Service/projectServices.dart';
import '../Widgets/projectWidget.dart';
import 'package:ollert/models/Project.dart';

class LogoutPage extends StatefulWidget {
  @override
  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  /*List<Project> projects = [
    Project(
        id: 1,
        name: "projet 1",
        type: "IT",
        description:
            "Résultat de recherche d'images pour description projet. La description du projet est une déclaration écrite formelle du projet, de son idée et de son contexte, qui explique les buts et les objectifs à atteindre, le besoin commercial et le problème à résoudre, les pièges et les défis potentiels, les approches et les méthodes d'exécution, les estimations des ressources",
        deadline: DateTime(2021, 12, 29),
        idManager: 1),
    Project(
        id: 1,
        name: "projet 2",
        type: "IT",
        description:
            "Résultat de recherche d'images pour description projet. La description du projet est une déclaration écrite formelle du projet, de son idée et de son contexte, qui explique les buts et les objectifs à atteindre, le besoin commercial et le problème à résoudre, les pièges et les défis potentiels, les approches et les méthodes d'exécution, les estimations des ressources",
        deadline: DateTime(2021, 12, 29),
        idManager: 1),
    Project(
        id: 1,
        name: "projet 3",
        type: "IT",
        description:
            "Résultat de recherche d'images pour description projet. La description du projet est une déclaration écrite formelle du projet, de son idée et de son contexte, qui explique les buts et les objectifs à atteindre, le besoin commercial et le problème à résoudre, les pièges et les défis potentiels, les approches et les méthodes d'exécution, les estimations des ressources",
        deadline: DateTime(2021, 12, 29),
        idManager: 1),
    Project(
        id: 1,
        name: "projet 4",
        type: "IT",
        description:
            "Résultat de recherche d'images pour description projet. La description du projet est une déclaration écrite formelle du projet, de son idée et de son contexte, qui explique les buts et les objectifs à atteindre, le besoin commercial et le problème à résoudre, les pièges et les défis potentiels, les approches et les méthodes d'exécution, les estimations des ressources",
        deadline: DateTime(2021, 12, 29),
        idManager: 1),
  ];*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
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
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 25,
                        )),
                    const Text(
                      "Projects",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          await AuthService().SingOut().then((value) {
                            if (value) {
                              print('value ' + value.toString());
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "/", (route) => false);
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.logout,
                          size: 25,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                /*Dismissible(
                    key: UniqueKey(),
                    child: ProjectWidget(
                      project: projects[i],
                    ),
                    //this instruction disable swiping when the member is authenticated
                    //direction: DismissDirection.none,
                    onDismissed: (direction) {
                      setState(() {
                        projects.removeAt(i);
                      });
                    },
                  ),*/

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: FutureBuilder<List<Project>>(
                      future: ProjectServices().getProjects(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          // return: show loading widget
                        }
                        if (snapshot.hasError) {
                          // return: show error widget
                        }
                        List<Project> projects = snapshot.data ?? [];
                        return ListView.builder(
                            itemCount: projects.length,
                            itemBuilder: (context, index) {
                              Project project = projects[index];
                              return ProjectWidget(project: project);
                            });
                      }),
                )
              ],
            ),
          )),
    ));
  }
}

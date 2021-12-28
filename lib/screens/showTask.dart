// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ollert/models/project.dart';
import 'package:ollert/models/task.dart';

class ShowTask extends StatelessWidget {
  Project? project;
  Task? task;
  Map<String, dynamic>? objet;

  @override
  Widget build(BuildContext context) {
    objet = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    project = objet!["project"];
    task = objet!["task"];

    return SafeArea(
        child: Scaffold(
      body: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
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
                icon: Icon(
                  Icons.arrow_back,
                  size: 25,
                )),
            Text(
              task?.name ?? "",
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
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffFAFAFA),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        project?.name.toUpperCase() ?? "",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Text(
                              "Date limite de la tâche :",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "${task?.deadline?.day.toString()}/${task?.deadline?.month.toString()}/${task?.deadline?.year.toString()} ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Text(
                              "Date limite du projet :",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "${project?.deadline?.day.toString()}/${project?.deadline?.month.toString()}/${project?.deadline?.year.toString()} ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            ),
                          ],
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(task?.description??""),
                    )

                  ],
                ),
              ),
            ))
      ]),
    ));
  }
}

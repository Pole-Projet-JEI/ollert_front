// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ollert/Widgets/TextFieldWidget.dart';
import 'package:ollert/models/Project.dart';
import 'package:ollert/screens/TaskPage.dart';
import 'package:ollert/screens/signOut.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        // padding: EdgeInsets.only(top:50),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black87,
                      ))
                ],
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/task_icon.png',
                width: 150,
              ),
              SizedBox(height: 20),
              const Text(
                "Ajouter nouvelle tâche",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFieldWidget(name: "Nom"),
              TextFieldWidget(name: "Date limite"),
              TextFieldWidget(name: "Description"),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [Color(0xff219138), Color(0xff1fc441)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                width: 140,
                height: 40,
                child: FlatButton(
                  onPressed: () async {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(color: Color(0xff1fc441))),
                  textColor: Colors.black54,
                  child: Center(
                    child: Text(
                      "Ajouter".toUpperCase(),
                      style: const TextStyle(
                        color: Color(0xffc9f5d2),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}

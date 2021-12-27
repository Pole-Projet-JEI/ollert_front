import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ollert/Service/projectServices.dart';
import 'package:ollert/Widgets/TextFieldWidget.dart';
import 'package:ollert/models/project.dart';
import 'package:ollert/screens/signOut.dart';

class AddProject extends StatelessWidget {
   AddProject({ Key? key }) : super(key: key);
    TextEditingController controllerName = TextEditingController(text: "Enter your Project Name");
    TextEditingController controllerType = TextEditingController(text: "Enter your Project Type");
    TextEditingController controllerDeadline = TextEditingController(text: "Enter your Project Deadline");
    TextEditingController controllerDescription = TextEditingController(text: "Enter your Project Description");


  @override
  Widget build(BuildContext context) { 
    final topPadding = MediaQuery.of(context).padding.top;
    return SafeArea(
      child : Scaffold(
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
          children: [
            SizedBox(height: topPadding),
            SizedBox(height: 5),
            Image.asset('assets/picture1.png'),
            const Text(
                    " Add new Project",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            textfieldwidget("  name"),
            textfieldwidget("  type"),
            textfieldwidget("  deadline"),
            textfieldwidget("  description"),
                
                  TextButton(
                  onPressed: () {
                    print(
                      controllerName.text +
                       controllerType.text +
                          controllerDeadline.text+
                          controllerDescription.text,
                    );
                    Project p= Project(
                      name: controllerName.text,
                      type: controllerType.text,
                      deadline: DateTime.parse(controllerDeadline.text),
                      description :controllerDescription.text,
                    );
                    print(p.name +
                        p.type +
                      p.deadline.toString() +
                        p.description
                    );
                    ProjectServices.addProject(p);
                    Navigator.of(context).pop();
                  },
                  child: Text("Add"),
                ),
          ],
          )
        ,),
        )
        ),
        );
            
  
  }
     
}
 
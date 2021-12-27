import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ollert/Service/projectServices.dart';
import 'package:ollert/Service/usersServices.dart';
import 'package:ollert/Widgets/TextFieldWidget.dart';
import 'package:ollert/Widgets/getMembersButton.dart';
import 'package:ollert/Widgets/textBox.dart';
import 'package:ollert/models/project.dart';
import 'package:ollert/screens/signOut.dart';

class AddProject extends StatefulWidget {


  const AddProject({Key? key}) : super(key: key);

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  List<int> members=[];

  TextEditingController name=TextEditingController();

  TextEditingController type=TextEditingController();

  TextEditingController description=TextEditingController();

  TextEditingController deadline=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
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
              SizedBox(height: topPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width:10),
                IconButton(onPressed: (){
                  Navigator.of(context).pop();
                }, icon: const Icon(Icons.arrow_back,size: 30,color:Colors.white)),
              ],),
              //SizedBox(height: 5),
              Image.asset(
                'assets/picture1.png',
                width: 130,
              ),
              const SizedBox(height: 15),
              const Text(
                "Ajouter un nouveau projet",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              TextFieldWidget(
                name: "Nom du projet",
                controller: name,
              ),
              getMembersButton(
                name: "Membres",
                onConfirmed: (value){
                  setState(() {
                    members=value;
                  });
                },
              ),
              TextFieldWidget(
                name: "Type du projet",
                controller: type
              ),
              TextFieldWidget(
                name: "Description",
                controller: description,
              ),
              TextFieldWidget(
                name: "Deadline",
                controller: deadline,
              ),
              const SizedBox(height: 20),
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
                  onPressed: () async {
                    var project = {
                      "name": name.text,
                      "type": type.text,
                      "description": description.text,
                      "deadline": deadline.text
                    };
                    await ProjectServices().addProject(project, members);
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/projects", (route) => false);
                  },
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
              const SizedBox(height: 20),

            ],
          ),
        ),
      )),
    );
  }
}


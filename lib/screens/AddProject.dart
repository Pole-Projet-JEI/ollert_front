import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ollert/Widgets/TextFieldWidget.dart';
import 'package:ollert/models/Project.dart';
import 'package:ollert/screens/signOut.dart';

class AddProject extends StatelessWidget {
  const AddProject({ Key? key }) : super(key: key);

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
            textfieldwidget("  ID"),
            textfieldwidget("  type"),
            textfieldwidget("  deadline"),
            textfieldwidget("  description"),
            ElevatedButton(
                  onPressed: () { Navigator.push( context,
              MaterialPageRoute(builder: (context) => LogoutPage()),
            );
                  },
                  child: Text('done', style : TextStyle(
                    fontSize: 20.0,),
                ))
          ],
          )
        ,),
        )
        ),
        );
            
  
  }
     
}
 
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ollert/screens/AddProject.dart';
import 'package:ollert/screens/signIn.dart';

class LogoutPage extends StatefulWidget {
  @override
  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
     Scaffold(
       appBar:  AppBar (  title: Text("Projects"),
          centerTitle: true,
        ),
      body: 
      Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                },
                child: Text(
                  " Projet1:"
                ),
              ),
              TextButton(
                
                onPressed: () { 
                },
                child: Text(
                  " Projet2:",
                    ),
                ),
                TextButton(
                onPressed: () { 
                },
                child: Text(
                  " Projet3:",
                    ),
                ),
           Column(children: [
             Padding(    padding: EdgeInsets.only(left: 12, right: 180, top: 350),
child:TextButton(
  style: TextButton.styleFrom(

  ),
  onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
  );},
  child: const Text('SignOut?',
    style: TextStyle(
      color: Colors.black,
      decoration: TextDecoration.underline,

      fontSize: 16,
      fontWeight: FontWeight.bold,

    ),),
    
),

        ),
           ]
           )
           ]
           ),
           floatingActionButton: FloatingActionButton(
             onPressed: () {
               Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) => AddProject() ),
  );},
             child: Text ('ADD'),
             backgroundColor: Colors.blueGrey, )
             ,),
           );
  }}
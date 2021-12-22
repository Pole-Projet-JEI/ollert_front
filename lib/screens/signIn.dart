


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ollert/Service/auth.dart';


class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

bool isLoad=false;


  @override
  Widget build(BuildContext context) {
    TextEditingController controllerDescription =
    TextEditingController();
    TextEditingController PasswordControler =
    TextEditingController();
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color:Color(0xff5a9bef),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: 0.0,
              ),
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Sign In',
                    style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 50, right: 5, top: 40),
                      child: Row(children:[Text(
                        'Username',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                        Padding(
                            padding: EdgeInsets.only(left: 10, right: 5, top: 18)),
                        Icon(Icons.mail),],),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5, top: 5),

                  ),


               Column(
          children :[Padding(
            padding: EdgeInsets.only(left: 5, right: 5, top: 2),

          ),
            SizedBox(
            child:  Padding(
                padding: EdgeInsets.only(left: 1, right: 1, top: 1, bottom:1),


                child:  TextFormField(

                    controller: controllerDescription,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: '',
                    ),
                ),
                  ),),


                  ],

                ),

                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 50, right: 5, top: 18),
                      child:Row(children :[ Text(
                        'Password',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 5, top: 18)),
                        Icon(Icons.vpn_key),
                      ],),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5, top: 5),

                  ),
                  Column(
                    children :[Padding(
                      padding: EdgeInsets.only(left: 5, right: 5, top: 2),

                    ),
                      SizedBox(
                        child:  Padding(
                          padding: EdgeInsets.only(left: 1, right: 1, top: 1, bottom:1),


                          child:  TextFormField(

                            controller: PasswordControler,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),

                            ),
                          ),
                        ),),


                    ],

                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10, right: 5, top: 50)),
                  Row (children :[
                    SizedBox(
                      width: 200,
                    ),

                 RaisedButton(
                     color:Color(0xffd1d2),
                      child:Text('se connecter  ',style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,),),



                      onPressed: () {   AuthService(isLoad:this.isLoad).signIn(controllerDescription.text,PasswordControler.text);
                      print("/this is working");
                       setState(() {


                        isLoad=true;


                      });
                        /* signIn(controllerDescription,controllerDescriptionn)
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) => LoginPage()),*/
                      },),


                  ]),

                   ],


              ),
            ),
          ),
    ),),);
  }
}



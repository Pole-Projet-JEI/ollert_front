import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
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
                      child: Text(
                        'Email',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5, top: 5),

                  ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 45),
                width: double.infinity,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.white,
                  child:
                  Row(
                children:   [
                  Icon(Icons.mail,),Text(
                  '',
                  style: TextStyle(fontSize: 16, color: Color(0xff5a9bef)),
              ),
                  ],),
                  onPressed: () {

                  },
                ),
              ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 50, right: 5, top: 18),
                      child: Text(
                        'Password',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5, top: 5),

                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 45),
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      color: Colors.white,
                      child:
                      Row(
                        children:   [
                          Icon(Icons.vpn_key,),Text(
                            '',
                            style: TextStyle(fontSize: 16, color: Color(0xff5a9bef)),
                          ),
                        ],),
                      onPressed: () {

                      },
                    ),
                  ),



                      ],
                    ),
                  ),

              ),
            ),
          ),
    );
  }
}
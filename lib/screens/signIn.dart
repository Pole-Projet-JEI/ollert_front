import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ollert/Service/authServices.dart';
import 'package:ollert/Widgets/textBox.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerDescription = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff40C7DA), Color(0xff398AA3)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
            //Color(0xff5a9bef),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Align(
                    child: Padding(
                        padding: EdgeInsets.only(left: 5, right: 5, top: 80),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 50,
                          child: Icon(
                            Icons.person,
                            size: 100,
                            color: Colors.blueGrey,
                          ),
                        )),
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBoxWidget(name:"Username",hintText: "Enter your username",
                  icon:Icons.person,controller: controllerDescription,),
                  TextBoxWidget(name:"Password",hintText: "Enter your password",
                  icon:Icons.vpn_key,controller: passwordController,inputType: TextInputType.visiblePassword,
                  obscureText: true,),
                  const Padding(
                      padding: EdgeInsets.only(left: 10, right: 5, top: 50)),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [Color(0xff219138), Color(0xff1fc441)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    width: 150,
                    height: 50,
                    child: FlatButton(
                      onPressed: () {
                        AuthService(isLoad: this.isLoad)
                            .signIn(controllerDescription.text,
                                passwordController.text)
                            .then((value) {
                          setState(() {
                            print("button" +
                                controllerDescription.text +
                                " " +
                                passwordController.text);
                            isLoad = true;
                            Navigator.of(context).pushNamed('/projects');
                          });
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Color(0xff1fc441))),
                      textColor: Colors.black54,
                      child: Center(
                        child: Text(
                          "Login".toUpperCase(),
                          style: const TextStyle(
                            color: Color(0xffc9f5d2),
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

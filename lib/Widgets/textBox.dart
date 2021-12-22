import 'package:flutter/material.dart';

class TextBoxWidget extends StatelessWidget {
  String name;
  String hintText;
  bool obscureText;
  IconData? icon;
  TextInputType inputType;
  TextEditingController? controller;

  TextBoxWidget({this.obscureText=false,this.name="",this.hintText="",this.icon,this.controller,this.inputType=TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding:
            const EdgeInsets.only(left: 50, right: 5, top: 30),
            child: Row(
              children:  [
                Text(
                  name,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Padding(
                    padding:
                    EdgeInsets.only(left: 10, right: 5, top: 18)),
                //Icon(Icons.mail),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 5, right: 5, top: 5),
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 5, right: 5, top: 2),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 40),
                child: TextFormField(
                  obscureText: obscureText,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hintText,
                    prefixIcon: Icon(icon),
                    fillColor: Colors.white38,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide:
                      const BorderSide(color: Colors.white38),
                    ),
                    //fillColor: Colors.green
                  ),
                  keyboardType: inputType,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {

  String name;
  String hint;
  TextEditingController? controller;
  TextFieldWidget({this.name="",this.controller ,required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding:
            const EdgeInsets.only(left: 20, right: 5, top: 20),
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
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 10,vertical: 2.5),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              fillColor: Colors.white38,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:
                const BorderSide(color: Colors.white38),
              ),
              //fillColor: Colors.green
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';


class taskState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        //crossAxisAlignment: CrossAxisAlignment.start,

       mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children:<Widget> [
          ElevatedButton(onPressed:(){},style: raisedButtonStyle,
              child: const Text("To do")),
          ElevatedButton(onPressed:(){ }, style: raisedButtonStyle,
              child: const Text("Doing")),
          ElevatedButton(onPressed:(){}, style: raisedButtonStyle,
              child: const Text("Done")),
        ]
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Colors.green.shade300,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
  ),
);
import 'package:flutter/material.dart';
class TaskPage extends StatelessWidget {
  const TaskPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
          body: Stack(
            alignment:AlignmentDirectional.bottomEnd,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff40C7DA), Color(0xff398AA3)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 20,
                ),
               IconButton(
                    onPressed: (){},
                    icon: const Icon(
                      Icons.keyboard_arrow_left_rounded ,
                      size: 25,
                    )),
                const Text(
                  "         Tasks",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                
              ],
            ),
       )
        ]))
      );
  }
}
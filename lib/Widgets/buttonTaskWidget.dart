import 'package:flutter/material.dart';
import 'package:ollert/models/task.dart';


class buttonTaskWidget extends StatelessWidget {
  Task task;
  double? width;
  buttonTaskWidget({Key? key, required this.task,this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/AddTask", arguments: task);
        },
        style: ElevatedButton.styleFrom(
          fixedSize:  Size(width??350,0),
          primary: Colors.black45,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        child: Text(task.name??""));
  }
}



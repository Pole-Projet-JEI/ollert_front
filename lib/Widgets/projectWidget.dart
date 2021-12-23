import 'package:flutter/material.dart';
import 'package:ollert/models/Project.dart';

class ProjectWidget extends StatelessWidget {
  Project? project;
  ProjectWidget({required this.project });

  @override
  Widget build(BuildContext context) {

    return FlatButton(onPressed: (){}, child: Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width*0.95,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color:Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))  ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${project?.name}",style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent
              ),),
              Text("${project?.deadline?.day.toString()}/${project?.deadline?.month.toString()}/${project?.deadline?.year.toString()} "),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.03,),

          Row(
            children: [
              Text("Type : ${project?.type}",style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent
              ),),

            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.03,),
          Text("${project?.description}",style: const TextStyle(
            fontSize: 15,

          ),)

        ],
      ),

    ));
  }
}

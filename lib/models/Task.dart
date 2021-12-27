// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
    Task({
     required   this.name,
     required this.state,
       this.id=0,
       required this.project,
      required  this.description,
       required this.deadline,
    });

    String name;
    int id;
    String project;
    String description;
    String deadline;
    String state;

    factory Task.fromJson(Map<String, dynamic> json) => Task(
        name: json["name"],
        id: json["Id"],
        project: json["project"],
        description: json["description"],
        deadline: json["deadline"],
        state: json["state"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "Id": id,
        "project": project,
        "description": description,
        "deadline": deadline,
        "state": state,
    };
}


// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

List<Task> taskFromJson(String str) => List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String taskToJson(List<Task> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
  Task({
    this.id,
    this.name,
    this.description,
    this.deadline,
    this.idProject,
    this.idState,
  });

  int? id;
  String? name;
  String? description;
  DateTime? deadline;
  int? idProject;
  int? idState;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    deadline: DateTime.parse(json["deadline"]),
    idProject: json["id_project"],
    idState: json["id_state"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "deadline": deadline?.toIso8601String(),
    "id_project": idProject,
    "id_state": idState,
  };
}

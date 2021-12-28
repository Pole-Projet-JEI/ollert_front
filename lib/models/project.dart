// To parse this JSON data, do
//
//     final project = projectFromJson(jsonString);

import 'dart:convert';

List<Project> projectFromJson(String str) => List<Project>.from(json.decode(str).map((x) => Project.fromJson(x)));

String projectToJson(List<Project> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Project {
  Project({
    this.id,
   required this.name,
   required this.type,
   required this.description,
   required  this.deadline,
    this.idManager,
  });

  int? id;
  String name;
  String type;
  String description;
  DateTime? deadline;
  int? idManager;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    description: json["description"],
    deadline: DateTime.parse(json["deadline"]),
    idManager: json["id_manager"],
  );

  Map<String, dynamic> toJson() => {
    "id": id??0,
    "name": name,
    "type": type,
    "description": description,
    "deadline": deadline?.toIso8601String(),
    "id_manager": idManager??0,
  };
}

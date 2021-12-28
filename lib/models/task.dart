import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
    Task({
      this.id,
         this.name,
        this.description,
       required this.deadline,
       this.id_project,
       this.id_state,

    });

    String? name;
    int? id;
    int? id_project;
    String? description;
    String? deadline;
    int? id_state;

    factory Task.fromJson(Map<String, dynamic> json) => Task(
        name: json["name"],
        id: json["id"],
        id_project: json["id_project"],
        description: json["description"],
        deadline: json["deadline"],
        id_state: json["id_state"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "id_project": id_project,
        "description": description,
        "deadline": deadline,
        "id_state": id_state,
    };
}


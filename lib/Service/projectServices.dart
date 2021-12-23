import 'package:http/http.dart' as http;
import 'package:ollert/Settings/config.dart';
import 'dart:convert';
import 'package:ollert/models/Project.dart';



class ProjectServices{

  Future<List<Project>> getProjects() async
  {

    print('d5alt');
    var response = await http.get(Uri.parse("${Config.url}/projects/"));
    print(response.body);
    if(response.statusCode==200)
      {
        print('fil status');
        var jsonData = json.decode(response.body);
        var projects = projectFromJson(jsonData);

        print("getProjects 5edmet "+projects[0].name);

        return projects;
      }
    return [];
  }

}
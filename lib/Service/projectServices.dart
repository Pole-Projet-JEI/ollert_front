import 'package:http/http.dart' as http;
import 'package:ollert/Settings/config.dart';
import 'dart:convert';
import 'package:ollert/models/project.dart';



class ProjectServices{

  Future<List<Project>> getProjects() async
  {
    var response = await http.get(Uri.parse("${Config.url}/projects/admin"));
    print(response.body);
    if(response.statusCode==200)
      {

        var projects = projectFromJson(response.body);
        return projects;
      }
    return [];
  }
  Future<bool> deleteProject(int? id) async
  {
    var response = await http.delete(Uri.parse("${Config.url}/projects/delete/$id"));
    print(response.body);
    if(response.statusCode==200)
      {
        print(" project deleted successfully !!! ");
        return true;
      }
    return false;
  }

}
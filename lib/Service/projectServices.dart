import 'package:http/http.dart' as http;
import 'package:ollert/Settings/config.dart';
import 'dart:convert';
import 'package:ollert/models/project.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ProjectServices{

  Future<List<Project>> getProjects() async
  {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    var response = await http.get(Uri.parse("${Config.url}/projects/"), headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": sharedPreferences.getString("token").toString()
    },);
    if(response.statusCode==200)
      {
        var projects = projectFromJson(response.body);
        return projects;
      }
    return [];
  }
  Future<bool> deleteProject(int? id) async
  {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    var response = await http.delete(Uri.parse("${Config.url}/projects/delete/$id"), headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": sharedPreferences.getString("token").toString()
    },
    );
    return(response.statusCode==200);
  }

  Future<bool> addProject(Map<String, dynamic> project,List<int> members) async
  {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    Map<String, dynamic> data = project;
    data["members"]=members.toString();
    var response = await http.post(Uri.parse("${Config.url}/projects/add"), headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": sharedPreferences.getString("token").toString()
    },
      body: data
    );
    return response.statusCode==200;
  }
}
import 'package:http/http.dart' as http;
import 'package:ollert/Settings/config.dart';
import 'dart:convert';
import 'package:ollert/models/project.dart';
import 'package:ollert/models/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasksServices {

  Future<List<Task>> getTasks(int id,String state) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.get(
      Uri.parse("${Config.url}/tasks/${state}/${id}"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": sharedPreferences.getString("token").toString()
      },
    );
    if (response.statusCode == 200) {
      var tasks = taskFromJson(response.body);
      return tasks;
    }
    return [];
  }
  Future<bool> deleteTask(int? id) async
  {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    var response = await http.delete(Uri.parse("${Config.url}/tasks/delete/$id"), headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": sharedPreferences.getString("token").toString()
    },
    );
    return(response.statusCode==200);

  }


  Future<bool> changeTaskState(int id,String state) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.put(
      Uri.parse("${Config.url}/tasks/${state}/${id}"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": sharedPreferences.getString("token").toString()
      },
    );
    return(response.statusCode==200);
  }

  Future<bool> addTask(Map<String,dynamic> task) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(
      Uri.parse("${Config.url}/tasks/add"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": sharedPreferences.getString("token").toString()
      },
      body: task
    );
    return(response.statusCode==200);
  }


}

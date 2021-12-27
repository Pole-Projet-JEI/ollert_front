import 'package:http/http.dart' as http;
import 'package:ollert/Settings/config.dart';
import 'dart:convert';
import 'package:ollert/models/project.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersServices{
  Future<List> getMembers()async
  {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    var response = await http.get(Uri.parse("${Config.url}/members/"), headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": sharedPreferences.getString("token").toString()
    },);

    return (jsonDecode(response.body));

  }
}
import 'package:http/http.dart' as http;
import 'package:ollert/Settings/config.dart';
import 'package:ollert/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthService {

  Future<bool> signIn(String username, String password) async {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    Map<String, dynamic> data = {
      "username": "$username",
      "password": "$password"
    };
    print(username + password);
    var response = await http.post(Uri.parse("${Config.url}/auth/login"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: data,
        encoding: Encoding.getByName("utf-8"));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      sharedPreferences.setString("email",jsonData["email"]);
      sharedPreferences.setString("token",jsonData["token"]);
      sharedPreferences.setString("expiresIn",jsonData["expiresIn"]);
      isManager().then((value) {
        if(value)
          {
            sharedPreferences.setBool("isManager",true);
          }
        else
          {
            sharedPreferences.setBool("isManager",false);
          }
      });
      print("ml sp "+ sharedPreferences.getString("token").toString());
    }
    return (response.statusCode == 200);
  }



  Future<bool> SingOut() async
  {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    var response = await http.get(Uri.parse("${Config.url}/logout"), headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": sharedPreferences.getString("token").toString()
    },);
    print(response.statusCode);
    if(response.statusCode==200)
      {
        await sharedPreferences.clear();
      }
    return (response.statusCode==200);
  }

  Future<bool> isManager() async
  {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    if(sharedPreferences.containsKey("email"))
      {
        return(sharedPreferences.getString("email")?.split("@")[1]=="jei-2021.tn");
      }
    return false;
  }
}

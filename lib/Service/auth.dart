import 'package:http/http.dart' as http;
import 'package:ollert/Settings/config.dart';
import 'package:ollert/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthService {
  bool isLoad;

  AuthService({required this.isLoad});

  Future<void> signIn(String username, String password) async {
    User user;

    // SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    Map<String, dynamic> data = {
      "username": "$username",
      "password": "$password"
    };
    print(username + password);
    var response = await http.post(Uri.parse("${Config.url}/auth/login"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: data,
        encoding: Encoding.getByName("utf-8"));
    print("amal w pisa");
    if (response.statusCode == 200) {
      isLoad = false;
      var jsonData = json.decode(response.body);
      user = User.fromJson(jsonData);
      if (user != null) {
        print(user.username);
      }
    }
  }
}
/*   sharedPreferences.setString("token", jsonData('token'));
        /* Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: builder), (route) => false)*/

    }else
    {print(response.body);};
    SharedPreferencesService.instance.setString('email', response.body['',email] as String);
    SharedPreferencesService.instance.setString('password', response.body['',pasword] as String);
  }


}
class SharedPreferencesService {

  SharedPrefrencesService(){};

  static late SharedPreferences _sharedPreferences;
  static Future<void> initService() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance => _sharedPreferences;
}*/

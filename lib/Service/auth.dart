import 'package:http/http.dart' as http;
import 'package:ollert/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthService{
  bool isLoad;
  AuthService({required this.isLoad });
  signIn(String username, String password) async{
    User user;

   /* SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
*/    Map<String,String> data={'username': '$username',
      'password': '$password'};
print(username+password);
    var  response = await http.post(

        Uri.parse("http://10.0.2.2:3000/auth/login"),
        body: jsonEncode(data),
        headers: {
          "Content-Type": "application/json"
        });
    print("amal w pisa");
    if (response.statusCode == 200){
      isLoad=false;
     var jsonData= json.decode(response.body);

      user=User.fromJson(jsonData);
      if(user!=null){print(user.username);}}

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
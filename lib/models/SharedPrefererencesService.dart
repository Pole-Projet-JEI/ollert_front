import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesService{
  SharedPrefrencesService._();

  static late SharedPreferences _sharedPreferences;
  static Future<void> initService() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance => _sharedPreferences;
}
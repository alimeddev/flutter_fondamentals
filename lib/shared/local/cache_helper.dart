import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper{

  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  // db ghan7eto data li ghadi t sava
  static Future<bool> setBoolean (
    // future bool wach key false or true
    {
      required String key,
      required bool value,
    }
  )async{
   return await sharedPreferences.setBool(key, value);
  }
  // method kat3tina bool li msavi f key 
  static bool? getBoolean(
    {required String key}
  ){
    return  sharedPreferences.getBool(key);
  }
}
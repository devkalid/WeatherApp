import 'package:shared_preferences/shared_preferences.dart';


class Shared{

 static late  SharedPreferences sharedPreferences;

  static init()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // String , bool , int , double

static putString({required String key, required String value}){
    sharedPreferences.setString(key, value);
}
  static getString({required String key}){
   return sharedPreferences.getString(key)?? " ";
}


  static putBOOL({required String key, required bool value}){
    sharedPreferences.setBool(key, value);
}
  static getBOOL({required String key}){
    return sharedPreferences.getBool(key) ?? false;
}

 static putInt({required String key, required int value}){
    sharedPreferences.setInt(key, value);
}
 static getInt({required String key}){
    return sharedPreferences.getInt(key) ?? 0;
}
 static putDouble({required String key, required double value}){
    sharedPreferences.setDouble(key, value);
}
 static getDouble({required String key}){
    return sharedPreferences.getDouble(key)?? 0.0;
}

deleteData(){
    sharedPreferences.clear();
}
removeData({key}){
    sharedPreferences.remove(key);
}


}
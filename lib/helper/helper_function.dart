import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  //key
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userPasswordKey = "USERPASSWORDKEY";

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNameKey, userName);
  }

  static Future<bool> saveUserPasswordSF(String userPassword) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userPasswordKey, userPassword);
  }

  //getting data from SF

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  static Future<String?> getUserNameFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }

  static Future<String?> getUserPasswordFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userPasswordKey);
  }
}

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString("token")!;
    print('read :$value');
    return value;
  }

  Future<bool> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("token", token);
    return true;
  }

  static saveUserToSharePreference(Map<String, dynamic> data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('currentUser', jsonEncode(data));
    print('.........................LOGING...................');
    return prefs.commit();
  }

  static removeUserToSharePreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("currentUser");
    print('..............REMOVE.............');
  }
}

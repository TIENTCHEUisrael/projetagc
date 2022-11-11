import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CustumerPreferences {
  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString("customertoken")!;
    return value;
  }

  Future<bool> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("customertoken", token);
    return true;
  }

  static saveCustumerToSharePreference(Map<String, dynamic> data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('currentCustumer', jsonEncode(data));
    print('.........................LOGING...................');
    return prefs.commit();
  }

  static removeCustumerToSharePreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("currentCustumer");
    print('..............REMOVE.............');
  }
}

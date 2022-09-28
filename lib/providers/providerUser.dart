import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user/shareduser.dart';
import '../models/user/user.dart';
import '../services/services.dart';

enum Statut {
  registing,
  registed,
  notregisted,
  authenticating,
  authenticated,
  notauthenticate,
  updating,
  updated,
  notupdated,
  deleting,
  deleted,
  notdeleted,
}

class AuthProvider extends ChangeNotifier {
  String? _token;
  int? _id;
  User? _user;
  String? _name;
  Statut _logStatus = Statut.notauthenticate;
  Statut _updateStatus = Statut.notupdated;
  Statut _registerStatus = Statut.notregisted;
  Statut _deleteStatus = Statut.notdeleted;

  bool? get isAuth {
    return _token != null;
  }

  User get user {
    return _user!;
  }

  int get id {
    return _id!;
  }

  void setUSer(User us) {
    us = _user!;
    notifyListeners();
  }

  Statut get logStatus => _logStatus;
  set logStatus(Statut value) {
    _logStatus = value;
  }

  Statut get updateStatus => _updateStatus;
  set updateStatus(Statut value) {
    _updateStatus = value;
  }

  Statut get registerStatus => _registerStatus;
  set registerStatus(Statut value) {
    _registerStatus = value;
  }

  Statut get deleteStatus => _deleteStatus;
  set deleteStatus(Statut value) {
    _deleteStatus = value;
  }

  Future<Map<String, dynamic>?> loginUser(
      String identifiant, String pass) async {
    var result;
    var urlLogin = Uri.parse(
        '${Services.urlclient}/userAuthenticate.php?Identifiant=$identifiant&Password=$pass');

    try {
      print('...........................BEGIN......................;');
      _logStatus = Statut.authenticating;
      notifyListeners();
      final response = await http.post(urlLogin);
      if (response.statusCode == 200) {
        _logStatus = Statut.authenticated;
        var data = jsonDecode(response.body);
        _user = User.fromJson(data);
        UserPreferences.saveUserToSharePreference(data);
        print(_user);
        notifyListeners();
        result = {
          "statut": true,
          "message": "User authenticated",
          "user": _user!
        };
      } else {
        _logStatus = Statut.notauthenticate;
        notifyListeners();
        result = {
          "statut": false,
          "message": "User not authenticated",
        };
      }
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future<bool> tryAutoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool result;

    if (prefs.getString('currentUser') == null) {
      print('...........NOT LOGGING..............');
      result = false;
    } else {
      var extractUser = jsonDecode(prefs.getString('currentUser')!);
      print(prefs.getString('currentUser')!);
      _user = User.fromJson(extractUser);
      result = true;
      print('............ LOGGED..............');
    }
    return result;
  }

  Future<Map<String, dynamic>?> logOutUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var result;
    try {
      await UserPreferences.removeUserToSharePreference();
      notifyListeners();
      if (prefs.getString('currentUser') == null) {
        result = {"status": true, "message": "User removed", "user": _user};
      } else {
        result = {
          "status": false,
          "message": "User not removed",
          "user": _user
        };
      }
    } catch (e) {
      print(e);
    }
    return result;
  }
}

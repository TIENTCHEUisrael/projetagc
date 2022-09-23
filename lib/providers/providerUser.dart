import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/widgets.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import '../services/services.dart';

enum Statut {
  authenticating,
  authenticated,
  notauthenticate,
  updating,
  updated,
  notupdated,
}

class AuthProvider extends ChangeNotifier {
  String? _token;
  int? _id;
  String? _name;
  Statut _logStatus = Statut.notauthenticate;
  Statut _updateStatus = Statut.notupdated;

  String get token {
    return _token!;
  }

  bool? get isAuth {
    return _token != null;
  }

  int get id {
    return _id!;
  }

  String get name {
    return _name!;
  }

  void setToken(String tok) {
    tok = _token!;
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

  Future<Map<String, dynamic>?> loginUser(
      String identifiant, String pass) async {
    var result;
    var urlLogin = Uri.parse(
        '${Services.url_essai}/userauthenticate.php?Identifiant=$identifiant&Password=$pass');

    try {
      print('...........................BEGIN......................;');
      _logStatus = Statut.authenticating;
      notifyListeners();
      final response = await http.get(urlLogin);
      if (response.statusCode == 200) {
        print('............................................');
        _logStatus = Statut.authenticated;
        print(response.body);
        var responseb = response.body
            .substring(response.body.indexOf('document.cookie') + 17);
        print(responseb);
        //var data = jsonDecode(response.body);
        //print(data);
        notifyListeners();
        result = {
          "statut": true,
          "message": "User authenticated",
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
}

import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:projectagc/models/beneficiaire/beneficiaire.dart';
import 'package:projectagc/models/custumer/custumer.dart';
import 'package:projectagc/models/custumer/sharedCustumer.dart';
import 'package:projectagc/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user/shareduser.dart';
import '../models/user/user.dart';

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

class ProviderCustumer extends ChangeNotifier {
  String? _token;
  int? _count;
  Custumer? _custumer;
  User? _user;
  List<Beneficiaire>? _beneficiaires;
  Statut _logStatus = Statut.notauthenticate;
  Statut _updateStatus = Statut.notupdated;
  Statut _registerStatus = Statut.notregisted;
  Statut _deleteStatus = Statut.notdeleted;

  String get token {
    return _token!;
  }

  bool? get isAuth {
    return _token != null;
  }

  Custumer get custumer {
    return _custumer!;
  }

  User get user {
    return _user!;
  }

  List<Beneficiaire> get beneficiaires {
    return _beneficiaires!;
  }

  void setCustumer(Custumer us) {
    us = _custumer!;
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

  Future<Map<String, dynamic>?> loginCustumer(
      String identifiant, String pass) async {
    var _affiliaires;
    var result;
    try {
      final res = await InternetAddress.lookup('google.com');
      if (res.isNotEmpty && res[0].rawAddress.isNotEmpty) {
        var urlLogin = Uri.parse(
            '${Services.urlclient}Identifiant=$identifiant&Password=$pass&i=2');
        var response = await http.post(urlLogin);
        if (response.statusCode == 200) {
          print(
              "////////////////////////////////////START////////////////////");
          var data = jsonDecode(response.body);
          print(data);
          if (data['customer'][0]['Id'] == null) {
            result = {
              "statut": false,
              "message": "Password ou Identifiant incorrect"
            };
          } else {
            _token = data['customer'][0]['Id'];
            _count = data['affiliateCount'];

            notifyListeners();
            print('token :' + _token!);

            _custumer = Custumer.fromJson(data);
            notifyListeners();
            print('custumer :' + _custumer!.toString());
            CustumerPreferences().saveToken(_token!);
            CustumerPreferences.saveCustumerToSharePreference(data);
            notifyListeners();

            List temp = [];
            for (var i in data['affiliates']) {
              temp.add(i);
            }

            _beneficiaires = Beneficiaire.beneficiairesFromSnapshots(temp);
            notifyListeners();

            _user = User.fromJson(data['customer'][0]);
            UserPreferences.saveUserToSharePreference(data['customer'][0]);
            notifyListeners();
            result = {
              "statut": true,
              "message": "User authenticated",
              "custumer": _custumer!,
              "token": _token!,
              "beneficiaires": _beneficiaires!,
              "user": _user
              /*"beneficiare": _beneficiaires!,
              "count": _count!*/
            };
          }
        } else {
          result = {"statut": false, "message": "Statut code !=200"};
        }
      }
    } on SocketException catch (_) {
      result = {"statut": false, "message": "Connexion failed"};
    }
    return result;
  }

  /*Future<Map<String, dynamic>?> updateUser(String id, String newPass) async {
    var result;
    try {
      var urlPass =
          Uri.parse('${Services.urlupdate}Identifiant=$id&Password=$newPass');

      print('...........................BEGIN......................');
      _logStatus = Statut.updating;
      notifyListeners();
      final response = await http.post(urlPass);
      if (response.statusCode == 200) {
        _logStatus = Statut.updated;
        var data = jsonDecode(response.body);
        _user = User.fromJson(data);
        await UserPreferences.removeUserToSharePreference();
        UserPreferences.saveUserToSharePreference(data);
        print(_user);
        notifyListeners();
        result = {
          "statut": true,
          "message": "User updated",
          "user": _user!,
        };
      } else {
        _logStatus = Statut.notupdated;
        notifyListeners();
        result = {
          "statut": false,
          "message": "User not updated",
        };
      }
    } on SocketException catch (_) {
      result = {
        "statut": false,
        "message": "Connexion failed",
      };
    }
    return result;
  }*/

  Future<bool> tryAutoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool result;

    if (prefs.getString('customertoken') == null ||
        prefs.getString('currentCustumer') == null) {
      print('...........NOT LOGGING..............');
      result = false;
    } else {
      var extractCustomer = jsonDecode(prefs.getString('currentCustumer')!);
      print(prefs.getString('customertoken')!);
      _custumer = Custumer.fromJson(extractCustomer);

      var extractToken = prefs.getString('customertoken')!;
      _token = extractToken;
      notifyListeners();
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
      if (prefs.getString('currentCustumer') == null) {
        result = {"status": true, "message": "User removed"};
      } else {
        result = {
          "status": false,
          "message": "User not removed",
          "user": _custumer
        };
      }
    } catch (e) {
      print(e);
    }
    return result;
  }
}


/**List _temp = [];
            List _temps = [];
            for (var i in data['customer']) {
              _user = User.fromJson(i);
              UserPreferences.saveUserToSharePreference(i);
              notifyListeners();
              _temp.add(i);
            }
            print('user :' + _user!.toString());
            _users = User.usersFromSnapshots(_temp);
            print('users :' + _users!.toString());
            print('.....................................................');
            notifyListeners();

            for (var i in data['affiliates']) {
              _temps.add(i);
            }
            _beneficiaires = Beneficiaire.beneficiairesFromSnapshots(_temps);
            notifyListeners();

            print('affiliaires :' + _beneficiaires!.toString());
            print('......................................................');
            CustumerPreferences.saveCustumerToSharePreference(data); */

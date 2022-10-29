import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:projectagc/models/BonDePriseEnCharge/institution.dart';
import '../models/BonDePriseEnCharge/coupon.dart';
import '../models/BonDePriseEnCharge/locale.dart';
import '../services/services.dart';

enum Statut {
  registing,
  registed,
  notregisted,
  sending,
  sended,
  notsended,
  deleting,
  deleted,
  notdeleted,
}

class BPCProvider extends ChangeNotifier {
  String? _coupon;
  Statut _registerStatus = Statut.notregisted;
  Statut _sendedStatus = Statut.notsended;

  String get getCoupon {
    return _coupon!;
  }

  Statut get registerStatus => _registerStatus;
  set registerStatus(Statut value) {
    _registerStatus = value;
  }

  Statut get sendedStatus => _sendedStatus;
  set sendedStatus(Statut value) {
    _sendedStatus = value;
  }

  Future<Map<String, dynamic>?> generateCoupon(Coupon cpn) async {
    var result;
    notifyListeners();
    var url = Uri.parse(
        '${Services.urlcoupon}/newcoupon.php?ville=${cpn.ville}&partenaire=${cpn.partenaire}&client=${cpn.identifiantclient}');

    try {
      print('............................BEGIN.........................');
      registerStatus = Statut.registing;
      notifyListeners();
      final response = await http.post(url);
      if (response.statusCode == 200) {
        registerStatus = Statut.registed;
        var data = jsonDecode(response.body);
        _coupon = data['code'];
        print(_coupon);
        notifyListeners();
        result = {
          "statut": true,
          "message": "coupon generated",
          "coupon": _coupon!
        };
      } else {
        _registerStatus = Statut.notregisted;
        notifyListeners();
        result = {"statut": false, "message": "coupon not generated"};
      }
    } on SocketException catch (_) {
      result = {
        "statut": false,
        "message": "Connexion failed",
      };
    }
    return result;
  }

  static Future<List<Locales>> getlocales() async {
    var _var;
    try {
      var url = Uri.parse('${Services.urllist}?id=1');
      final response = await http.post(url);
      if (response.statusCode == 200) {
        print('GOOD');
        var data = jsonDecode(response.body);
        List _temp = [];

        for (var i in data['body']) {
          _temp.add(i);
        }

        _var = Locales.recipesFromSnapshot(_temp);
      } else {
        print('False');
      }
    } on SocketException catch (_) {
      print('Connexion failed');
    }

    return _var;
  }

  static Future<List<dynamic>> getTowns() async {
    var result;
    var url = Uri.parse("${Services.urlvillepartenaire}");
    try {
      final response = await http.post(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List _temp = [];
        for (var i in data) {
          _temp.add(i['town']);
        }

        return _temp;
      }
    } on SocketException catch (_) {
      print("connexion failed");
    }
    return result;
  }

  static Future<List<Institutions>> getPatnersByTown(String town) async {
    var listpartner;
    try {
      var urlall = Uri.parse('${Services.urlpartners}Town=$town');
      final response = await http.post(urlall);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List _temp = [];
        for (var i in data) {
          _temp.add(i);
        }
        print(_temp);
        listpartner = Institutions.recipesFromSnapshot(_temp);
      }
    } on SocketException catch (_) {
      print("not connexion");
    }
    return listpartner;
  }
}

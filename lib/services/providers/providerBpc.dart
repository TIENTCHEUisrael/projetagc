import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:projectagc/models/BonDePriseEnCharge/institution.dart';
import 'package:projectagc/models/statutCoupons/statutC.dart';
import '../../models/BonDePriseEnCharge/coupon.dart';
import '../../models/BonDePriseEnCharge/locale.dart';
import '../services.dart';

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

    try {
      notifyListeners();
      var url = Uri.parse(
          '${Services.urlcoupon}ville=${cpn.ville}&partenaire=${cpn.partenaire}&client=${cpn.identifiantclient}&statut=1&beneficial=${cpn.beneficial}');

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
      }
    } on SocketException catch (_) {
      result = {
        "statut": false,
        "message": "Connexion failed",
      };
    } catch (e) {}
    return result;
  }

  static Future<List<Locales>> getlocales() async {
    var _var;
    try {
      var url = Uri.parse('${Services.urllist}?id=1');
      final response = await http.post(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List _temp = [];

        for (var i in data['body']) {
          _temp.add(i);
        }

        _var = Locales.recipesFromSnapshot(_temp);
        print(_var);
      } else {
        _var = [];
        print('False');
      }
    } on SocketException catch (_) {
      print('Connexion failed');
    }

    return _var;
  }

  static Future<List<StatutC>> getStatuts(String identifiant) async {
    var listresult;
    List temp = [];
    var result;
    try {
      var urlstatut =
          Uri.parse('${Services.urlstatut}Identifiant=$identifiant&i=1');

      final response = await http.post(urlstatut);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        for (var i in data) {
          temp.add(i);
        }
        print(temp);
        listresult = StatutC.statutCFromSnapshots(temp);
      } else {
        result = {
          "statut": true,
          "message": "Your status",
          "result": listresult
        };
      }
    } on SocketException catch (_) {
      result = {
        "statut": false,
        "message": "Connexion failed",
      };
    }
    return listresult;
  }

  static Future<String> downoaldpdf(StatutC status) async {
    var result;
    var urlpdf = Uri.parse("${Services.urlpdf}/${status.idStatut}.pdf");
    try {
      var response = await http.get(urlpdf);
      if (response.statusCode == 200) {
        result = "${Services.urlpdf}/${status.idStatut}.pdf";
      } else {
        result = "";
      }
    } on SocketException catch (_) {
      result = "";
    }
    return result;
  }

  static Future<List<dynamic>> getTowns() async {
    List _temp = [];
    var url = Uri.parse("${Services.urlvillepartenaire}");
    try {
      final response = await http.post(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        for (var i in data) {
          _temp.add(i['town']);
        }
        print(_temp);
      }
    } on SocketException catch (_) {
      print("connexion failed");
    }
    return _temp;
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

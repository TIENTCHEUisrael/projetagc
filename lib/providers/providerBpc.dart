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
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future<Map<String, dynamic>?> sendEmail(String emetteur, String sujet,
      String recepteur, String message, String userEmail) async {
    var result;
    final url = Uri.parse('${Services.urlsendEmail}');
    const serviceId = "service_luqr6sg";
    const templateId = "template_5vvx4q3";
    const userId = "";
    _sendedStatus = Statut.sending;
    notifyListeners();
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": userId,
        "template_params": {
          "name": emetteur,
          "subject": sujet,
          "your_name": recepteur,
          "message": message,
          "user_email": userEmail
        }
      }),
    );
    if (response.statusCode == 200) {
      print('............BEGIN...............');
      _sendedStatus = Statut.sended;
      notifyListeners();
      result = {
        "statut": true,
        "message": "Email sended",
      };
    } else {
      _sendedStatus = Statut.notsended;
      notifyListeners();
      result = {
        "statut": false,
        "message": "Email not sended",
      };
    }
    return result;
  }

  static Future<List<Locales>> getlocales() async {
    var _var;
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

    return _var;
  }

  static Future<List<Institutions>> getPartenaireByVilleLocale(
      Locales loc, String ville) async {
    var _var;
    print('object');
    var url = Uri.parse(
        '${Services.urlinstitut}/get.php?Institution=${loc.id}&Town=$ville');
    final response = await http.post(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List _temp = [];

      for (var i in data) {
        _temp.add(i);
      }
      _var = Institutions.recipesFromSnapshot(_temp);
    } else {
      print(
          '.......................................False............................');
    }

    return _var;
  }

  static Future<List<Institutions>> getAllPartenaires() async {
    var _var;
    var url = Uri.parse('${Services.urlgetallinstitut}');
    final response = await http.post(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List _temp = [];

      for (var i in data) {
        _temp.add(i);
      }
      _var = Institutions.recipesFromSnapshot(_temp);
    } else {
      print(
          '.......................................False............................');
    }

    return _var;
  }
}

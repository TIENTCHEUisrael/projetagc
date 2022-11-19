import 'package:flutter/material.dart';
import 'package:projectagc/components/screens/NotFoundPage.dart';
import 'package:projectagc/components/screens/homePage/homeClientPage.dart';
import 'package:projectagc/components/screens/homePage/pagesClient/BonDePriseEnCharge.dart';
import 'package:projectagc/components/screens/homePage/pagesClient/historique.dart';
import 'package:projectagc/components/screens/homePage/pagesClient/profile.dart';
import 'package:projectagc/components/screens/homePage/pagesClient/servicereclamation.dart';
import 'package:projectagc/components/screens/homePage/pagesClient/statutB.dart';
import 'package:projectagc/components/screens/loginPage/loginPage.dart';
import 'route_names.dart';

class CustomRoute {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    var r = MaterialPageRoute(builder: (_) => NotFoundPage());
    switch (settings.name) {
      case homeRoute:
        r = MaterialPageRoute(builder: (_) => HomeClientPage());
        break;
      case compteRoute:
        r = MaterialPageRoute(builder: (_) => Profile());
        break;
      case statutRoute:
        r = MaterialPageRoute(builder: (_) => StatutBpc());
        break;
      case historiqueROute:
        r = MaterialPageRoute(builder: (_) => HistoriquePage());
        break;
      case serviceRoute:
        r = MaterialPageRoute(builder: (_) => ServicePage());
        break;
      case bpcRoute:
        r = MaterialPageRoute(builder: (_) => BonPriseCharge());
        break;
      case loginRoute:
        r = MaterialPageRoute(builder: (_) => LoginPage());
        break;
    }
    return r;
  }
}

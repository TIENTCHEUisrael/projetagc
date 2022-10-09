import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectagc/localisation/localization_constant.dart';
import 'package:projectagc/main.dart';
import 'package:projectagc/models/classes/langages.dart';
import 'package:projectagc/themes/constants.dart';
import 'package:projectagc/widgets/navbarClient.dart';

import '../../widgets/bas.dart';
import 'pagesClient/BonDePriseEnCharge.dart';

class HomeClientPage extends StatefulWidget {
  const HomeClientPage({super.key});

  @override
  State<HomeClientPage> createState() => _HomeClientPageState();
}

class _HomeClientPageState extends State<HomeClientPage> {
  var color1 = blue_color;
  var color2 = blue_color;
  var height1 = 15;
  var height2 = 20;

  void _changeLanguage(language langage) async {
    Locale? _temp = await setLocale(langage.languagecode);
    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBarClient(),
      drawerScrimColor: Colors.grey,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.white,
        title: Center(
          child: Image.asset(
            "assets/images/png/agc2.png",
            height: 48,
            width: 48,
            fit: BoxFit.cover,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 35,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.moon_stars,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/png/doc.png",
                      height: 450,
                      width: 450,
                    ),
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 200.0),
                              child: Container(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 10),
                                margin:
                                    const EdgeInsets.only(left: 80, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue[100],
                                ),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        //'Requerir un bon de prise en charge',
                                        getTranslated(context, 'home_info'),
                                        style: TextStyle(
                                          color: blue_color,
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return BonPriseCharge();
                                            },
                                          ),
                                        );
                                      },
                                      child: Card(
                                        elevation: 3.2,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(60),
                                          ),
                                        ),
                                        child: Container(
                                          height: 90,
                                          width: 90,
                                          alignment: Alignment.center,
                                          child: const Icon(
                                            Icons.list_alt,
                                            color: blue_color,
                                            size: 50,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: blue_color),
              ),
              child: Center(
                child: Text(
                  getTranslated(context, 'home_button1'),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: blue_color),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: blue_color),
              ),
              child: Center(
                child: Text(
                  getTranslated(context, 'home_button2'),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: blue_color),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            bas(),
          ],
        ),
      ),
    );
  }
}

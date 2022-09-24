import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projectagc/themes/constants.dart';
import 'package:projectagc/widgets/navbarClient.dart';

import '../../widgets/bas.dart';
import 'pages/BonDePriseEnCharge.dart';

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
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Lottie.asset("assets/images/lottie/e.json",
                  height: 300, width: 300),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: const Text(
                      'Requerir un bon de prise en charge',
                      style: TextStyle(
                        color: blue_color,
                        fontSize: 18,
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
                        child: Icon(
                          Icons.cases_sharp,
                          color: blue_color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: blue_color),
              ),
              child: Center(
                child: Text(
                  'Parler a un conseiller',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: blue_color),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: blue_color),
              ),
              child: Center(
                child: Text(
                  "Besoin d'aide",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: blue_color),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            bas(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projectagc/screens/homePage/pageEntreprise/addClient.dart';
import 'package:projectagc/screens/splashPages/splashPage.dart';

import '../../../themes/constants.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Center(
              child: Lottie.asset("assets/images/lottie/e.json",
                  height: 300, width: 300),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Image.asset("assets/images/png/agc2.png",
                  height: 180, width: 180),
            ),
            const SizedBox(
              height: 3,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AddCompte();
                    },
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 75),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25), color: blue_color),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.person_add,
                      color: scaffoldbackground,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Ajouter un Compte',
                      style: TextStyle(color: scaffoldbackground),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: scaffoldbackground,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
/*floatingActionButton: FloatingActionButton.extended(
        tooltip: 'Ajouter un nouveau client',
        elevation: 2.2,
        backgroundColor: blue_color,
        label: Text(' Ajouter un Compte '),
        icon: const Icon(
          Icons.person_add,
          color: scaffoldbackground,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddCompte();
              },
            ),
          );
        },
      ),*/
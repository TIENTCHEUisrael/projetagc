import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectagc/screens/loginPage/loginPage.dart';
import 'package:projectagc/themes/constants.dart';
import '../../animations/buttonAnimation1.dart';

class ChoicePage extends StatefulWidget {
  const ChoicePage({super.key});

  @override
  State<ChoicePage> createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 30,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                delay: 100,
                child: Image.asset(
                  "assets/images/png/agc2.png",
                  height: 250,
                  width: 250,
                ),
              ),
              DelayedAnimation(
                delay: 100,
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Text(
                    'Statut :',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              DelayedAnimation(
                delay: 500,
                child: Container(
                  margin: EdgeInsets.all(20),
                  width: 210,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: blue_color,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.all(13),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }),
                      );
                    },
                    child: Text(
                      'Client',
                      style: GoogleFonts.poppins(fontSize: 22),
                    ),
                  ),
                ),
              ),
              DelayedAnimation(
                delay: 500,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  width: 210,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: blue_color,
                      shape: StadiumBorder(),
                      padding: EdgeInsets.all(13),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Container();
                        }),
                      );
                    },
                    child: Text(
                      'Partenaire',
                      style: GoogleFonts.poppins(fontSize: 22),
                    ),
                  ),
                ),
              ),
              DelayedAnimation(
                delay: 800,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 50,
                  ),
                  width: 210,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: blue_color,
                      shape: StadiumBorder(),
                      padding: const EdgeInsets.all(13),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Container();
                        }),
                      );
                    },
                    child: Text(
                      'Entreprise',
                      style: GoogleFonts.poppins(fontSize: 22),
                    ),
                  ),
                ),
              ),
              DelayedAnimation(
                delay: 100,
                child: Container(
                  width: double.infinity,
                  child: TextButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        Text(
                          'Precedent',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

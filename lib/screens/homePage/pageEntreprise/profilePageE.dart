import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projectagc/screens/loginPage/loginEntreprise.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../themes/constants.dart';

class ProfilePageE extends StatefulWidget {
  const ProfilePageE({super.key});

  @override
  State<ProfilePageE> createState() => _ProfilePageEState();
}

class _ProfilePageEState extends State<ProfilePageE> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
              /*gradient: LinearGradient(
              colors: [
                Color.fromRGBO(4, 9, 35, 1),
                Color.fromRGBO(39, 105, 171, 1),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),*/
              color: Colors.grey[300]),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              children: [
                Container(
                  height: heigth * 0.4,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double innerHeight = constraints.maxHeight;
                      double innerWight = constraints.maxWidth;
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: innerWight * 0.65,
                              width: innerWight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Prenom ',
                                          style: TextStyle(
                                              color: blue_color,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Nom ',
                                          style: TextStyle(
                                              color: blue_color,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Text(
                                      'Nom Societe',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 2,
                                    width: 300,
                                    color: blue_color,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Sexe',
                                        style: TextStyle(
                                            color: blue_color, fontSize: 16),
                                      ),
                                      Text(
                                        'Date de naissance',
                                        style: TextStyle(
                                            color: blue_color, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 13),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text(
                                        'Langue',
                                        style: TextStyle(
                                            color: blue_color, fontSize: 18),
                                      ),
                                      ToggleSwitch(
                                        minWidth: 60.0,
                                        cornerRadius: 23.0,
                                        activeBgColors: [
                                          [blue_color],
                                          [red_color]
                                        ],
                                        activeFgColor: Colors.white,
                                        inactiveBgColor: Colors.grey,
                                        inactiveFgColor: Colors.white,
                                        initialLabelIndex: 0,
                                        totalSwitches: 2,
                                        labels: const ['FR', 'EN'],
                                        radiusStyle: true,
                                        onToggle: (index) {
                                          print('switched to: $index');
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/images/png/prof.png',
                                    width: innerWight * 0.3,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: heigth * 0.46,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: scaffoldbackground),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Tap');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: blue_color,
                          ),
                          child: Text(
                            'Modifier son mot de passe',
                            style: TextStyle(
                                color: scaffoldbackground, fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                color: blue_color,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Aide',
                                style: TextStyle(
                                    color: scaffoldbackground, fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                color: blue_color,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'A propos',
                                style: TextStyle(
                                    color: scaffoldbackground, fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Image.asset(
                          "assets/images/png/agc2.png",
                          height: 130,
                          width: 130,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                            msg: "Message: Deconnexion",
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginEntreprisePage();
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: scaffoldbackground,
                              border: Border.all(color: blue_color)),
                          child: Text(
                            'Déconnexion',
                            style: TextStyle(color: red_color, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

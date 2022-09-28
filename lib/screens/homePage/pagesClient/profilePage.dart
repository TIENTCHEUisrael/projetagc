import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projectagc/themes/constants.dart';
import 'package:projectagc/widgets/popup.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../animations/custum.dart';
import '../../../providers/providerUser.dart';
import '../../../widgets/pageRoute.dart';
import '../../loginPage/loginPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.grey[200]),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: blue_color,
            leading: const BackButton(
              color: scaffoldbackground,
            ),
            title: const Center(
              child: Text(
                'Mon Compte',
                style: TextStyle(color: scaffoldbackground),
                textAlign: TextAlign.center,
              ),
            ),
            actions: [
              Image.asset(
                "assets/images/png/agc1.png",
                height: 40,
                width: 40,
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Consumer<AuthProvider>(builder: (context, auth, _) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
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
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 70.0),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  auth.user.prenom,
                                                  style: TextStyle(
                                                      color: blue_color,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  auth.user.nom,
                                                  style: TextStyle(
                                                      color: blue_color,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Center(
                                            child: Text(
                                              auth.user.societe,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          height: 2,
                                          width: 300,
                                          color: blue_color,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                auth.user.sexe,
                                                style: TextStyle(
                                                    color: blue_color,
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                auth.user.telephone,
                                                style: TextStyle(
                                                    color: blue_color,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(top: 13),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              const Text(
                                                'Langue',
                                                style: TextStyle(
                                                    color: blue_color,
                                                    fontSize: 18),
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/png/prof.png',
                                        width: innerWight * 0.3,
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  HeroDialogRoute(
                                    builder: (context) {
                                      return PopupMotdepasse();
                                    },
                                  ),
                                );
                              },
                              child: Hero(
                                tag: heroAddTodo,
                                createRectTween: (begin, end) {
                                  return CustomRectTween(
                                      begin: begin!, end: end!);
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
                                        color: scaffoldbackground,
                                        fontSize: 18),
                                  ),
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
                                          color: scaffoldbackground,
                                          fontSize: 18),
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
                                          color: scaffoldbackground,
                                          fontSize: 18),
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
                                      return LoginPage();
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
                                  style:
                                      TextStyle(color: red_color, fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projectagc/localisation/localization_constant.dart';
import 'package:provider/provider.dart';

import '../../../animations/custum.dart';
import '../../../main.dart';
import '../../../models/classes/langages.dart';
import '../../../providers/providerUser.dart';
import '../../../themes/constants.dart';
import '../../../widgets/bas.dart';
import '../../../widgets/pageRoute.dart';
import '../../../widgets/popup.dart';
import '../../loginPage/loginPage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void _changeLanguage(language language) async {
    Locale _locale = await setLocale(language.languagecode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<AuthProvider>(builder: (context, auth, _) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: scaffoldbackground),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          child: ClipOval(
                            child: Image.network(
                              auth.user.photo,
                              width: 150,
                              height: 100,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                auth.user.prenom,
                                style: TextStyle(
                                    color: blue_color,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                auth.user.nom,
                                style: TextStyle(
                                    color: blue_color,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Center(
                          child: Text(
                            auth.user.email,
                            style: TextStyle(
                              color: blue_color,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Societe :',
                                style:
                                    TextStyle(color: blue_color, fontSize: 15),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                auth.user.societe,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 6.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Identifiant :',
                                style:
                                    TextStyle(color: blue_color, fontSize: 15),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                auth.user.identifiant,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 2,
                        width: 300,
                        color: blue_color,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              auth.user.sexe,
                              style: TextStyle(color: blue_color, fontSize: 16),
                            ),
                            Text(
                              auth.user.telephone,
                              style: TextStyle(color: blue_color, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Langue',
                              style: TextStyle(color: blue_color, fontSize: 18),
                            ),
                            /*ToggleSwitch(
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
                              labels: const [French, English],
                              radiusStyle: true,
                              onToggle: (index) {
                                print('switched to: $index');
                                language lang = language(
                                    id: 1,
                                    name: '🇺🇸',
                                    flag: 'English',
                                    languagecode: "en");
                                language lang2 = language(
                                    id: 2,
                                    name: '🇫🇷',
                                    flag: 'French',
                                    languagecode: "fr");
                                if (index == 1) {
                                  _changeLanguage(lang);
                                } else {
                                  _changeLanguage(lang2);
                                }
                              },
                            ),*/
                            DropdownButton<language>(
                              items: language
                                  .languageList()
                                  .map(
                                    (e) => DropdownMenuItem<language>(
                                      value: e,
                                      child: Row(
                                        children: [
                                          Text(
                                            e.flag,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(e.name)
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (language? lang) {
                                _changeLanguage(lang!);
                              },
                              hint: Text(
                                getTranslated(context, 'change_language'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: scaffoldbackground),
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 30, bottom: 20),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                            return CustomRectTween(begin: begin!, end: end!);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 12),
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
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 12),
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
                                    horizontal: 25, vertical: 12),
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
                          margin: const EdgeInsets.only(top: 10),
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
              ),
              bas(),
            ],
          );
        }),
      ),
    );
  }
}

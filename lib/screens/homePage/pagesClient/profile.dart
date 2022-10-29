import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projectagc/localisation/localization_constant.dart';
import 'package:projectagc/routes/route_names.dart';
import 'package:provider/provider.dart';
import '../../../animations/custum.dart';
import '../../../main.dart';
import '../../../models/classes/langages.dart';
import '../../../providers/providerUser.dart';
import '../../../themes/constants.dart';
import '../../../widgets/bas.dart';
import '../../../widgets/pageRoute.dart';
import '../../../widgets/popup.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double t2 = 0.5;
  bool _isloading = true;
  void _changeLanguage(language language) async {
    Locale _locale = await setLocale(language.languagecode);
    MyApp.setLocale(context, _locale);
  }

  Future<void> calcul() async {
    AuthProvider pro = Provider.of<AuthProvider>(context);
    if (pro.user.maximum as double > 100000) {
      setState(() {
        t2 = 0.8;
        _isloading = false;
      });
    } else if (pro.user.maximum as double == 100000) {
      setState(() {
        t2 = 0.5;
        _isloading = false;
      });
    } else {
      setState(() {
        t2 = 0.4;
        _isloading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    calcul();
  }

  bool generate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue_color,
        leading: const BackButton(
          color: scaffoldbackground,
        ),
        title: Center(
          child: Text(
            getTranslated(context, 'nav_compte'),
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
                            child: auth.user.photo == null
                                ? Image.asset(
                                    "assets/images/png/profile.png",
                                    width: 150,
                                    height: 100,
                                  )
                                : Image.network(
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
                                getTranslated(context, 'compte_societe'),
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
                                getTranslated(context, 'compte_identifiant'),
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
                            Text(
                              getTranslated(context, 'compte_langue'),
                              style: TextStyle(color: blue_color, fontSize: 18),
                            ),
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
                                style: TextStyle(
                                  color: blue_color,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 4, left: 4, right: 4),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                getTranslated(context, "plafond"),
                                style: TextStyle(
                                  color: blue_color,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            _isloading
                                ? LinearProgressIndicator(
                                    minHeight: 18,
                                    backgroundColor: Colors.grey,
                                    value: 0.6,
                                  )
                                : LinearProgressIndicator(
                                    minHeight: 18,
                                    backgroundColor: Colors.grey,
                                    value: t2,
                                  ),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  getTranslated(context, 'plafond1'),
                                  style: TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  auth.user.maximum,
                                  style: TextStyle(
                                    color: blue_color,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                              ],
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
                              getTranslated(context, 'compte_modifier'),
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
                                  getTranslated(context, 'compte_aide'),
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
                                  getTranslated(context, 'compte_propos'),
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
                          Navigator.pushReplacementNamed(context, loginRoute);
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
                            getTranslated(context, 'compte_deconnexion'),
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

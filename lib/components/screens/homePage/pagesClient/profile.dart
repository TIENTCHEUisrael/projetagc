import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectagc/services/localisation/localization_constant.dart';
import 'package:projectagc/main.dart';
import 'package:projectagc/models/classes/langages.dart';
import 'package:projectagc/services/providers/providerCustumer.dart';
import 'package:projectagc/components/routes/route_names.dart';
import 'package:projectagc/services/themes/constants.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../widgets/bas.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double t2 = 0.5;
  bool _isloading = true;
  final motdepasse = TextEditingController();
  bool _isloading2 = false;
  bool _obscureText = true;
  Icon _iconchange = Icon(
    Icons.visibility,
    color: Colors.black,
  );
  void _changeLanguage(language language) async {
    Locale _locale = await setLocale(language.languagecode);
    MyApp.setLocale(context, _locale);
  }

  @override
  void initState() {
    super.initState();
    calcul();
  }

  Future<void> calcul() async {
    ProviderCustumer pro = Provider.of<ProviderCustumer>(context);
    if (pro.user.used as double == 0) {
      setState(() {
        t2 = 0.0;
        _isloading = false;
      });
    } else if (pro.user.used as double < (pro.user.maximum as double) / 2) {
      setState(() {
        t2 = 0.3;
        _isloading = false;
      });
    } else if (pro.user.used as double == pro.user.maximum as double) {
      setState(() {
        t2 = 1;
        _isloading = false;
      });
    } else if (pro.user.used as double > (pro.user.maximum as double) / 2) {
      setState(() {
        t2 = 0.7;
        _isloading = false;
      });
    } else if (pro.user.used as double == (pro.user.maximum as double) / 2) {
      setState(() {
        t2 = 0.5;
        _isloading = false;
      });
    }
  }

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
        child: Consumer<ProviderCustumer>(builder: (context, auth, _) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: scaffoldbackground),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          child: ClipOval(
                            child: auth.user.photo == "null"
                                ? Image.asset(
                                    "assets/images/png/profile.png",
                                    width: 150,
                                    height: 100,
                                  )
                                : Image.network(
                                    auth.user.photo,
                                    width: 150,
                                    height: 100,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                          'assets/images/png/profile.png',
                                          width: 100,
                                          height: 150,
                                          fit: BoxFit.contain);
                                    },
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
                                getTranslated(context, 'compte_fu'),
                                style: GoogleFonts.poppins(
                                  color: blue_color,
                                ),
                              ),
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
                            getTranslated(context, 'compte_em') +
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
                        height: 0.5,
                        width: MediaQuery.of(context).size.width / 1.5,
                        color: blue_color,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              getTranslated(context, 'compte_se'),
                            ),
                            Text(
                              auth.user.sexe,
                              style: TextStyle(color: blue_color, fontSize: 16),
                            ),
                            Text(
                              getTranslated(context, 'compte_nu'),
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
                                    minHeight: 5,
                                    backgroundColor: Colors.grey,
                                    value: 0.05,
                                  )
                                : LinearProgressIndicator(
                                    minHeight: 5,
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
                                  auth.user.used.toString(),
                                  style: TextStyle(
                                    color: blue_color,
                                  ),
                                ),
                                Text('/'),
                                Text(
                                  auth.user.maximum.toString(),
                                  style: TextStyle(color: blue_color),
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
                          showDialog(
                              context: context,
                              builder: ((context) {
                                return AlertDialog(
                                  content: Stack(
                                    children: [
                                      Positioned(
                                        right: -40.0,
                                        top: -40.0,
                                        child: InkResponse(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: CircleAvatar(
                                            child: Icon(Icons.close),
                                            backgroundColor: Colors.red,
                                          ),
                                        ),
                                      ),
                                      Form(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              height: 70,
                                              width: 70,
                                              child: Image.asset(
                                                'assets/images/png/LOGO.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 8.0, left: 8, right: 8),
                                              child: TextFormField(
                                                controller: motdepasse,
                                                obscureText: _obscureText,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Mot de passe",
                                                  icon: const Icon(Icons.key),
                                                  /*suffixIcon: IconButton(
                                                    icon: _iconchange,
                                                    onPressed: () {
                                                      if (_obscureText) {
                                                        setState(() {
                                                          _obscureText =
                                                              !_obscureText;
                                                          _iconchange =
                                                              const Icon(
                                                            Icons
                                                                .visibility_off,
                                                            color: Colors.black,
                                                          );
                                                        });
                                                      } else {
                                                        setState(() {
                                                          _obscureText =
                                                              !_obscureText;
                                                          _iconchange =
                                                              const Icon(
                                                            Icons.visibility,
                                                            color: Colors.black,
                                                          );
                                                        });
                                                      }
                                                    },
                                                  ),*/
                                                ),
                                                keyboardType:
                                                    TextInputType.name,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "S'il vous plait entrer votre mot de passe";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            Text(
                                              getTranslated(context,
                                                      'compte_modifier_soustitre') +
                                                  '${auth.user.motdepasse}',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 2.0),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _isloading2 = true;
                                                  });
                                                  String identifiant =
                                                      auth.user.identifiant;
                                                  print(identifiant);
                                                  auth
                                                      .updateCustumer(
                                                          auth.user.identifiant,
                                                          motdepasse.text)
                                                      .then((value) {
                                                    if (value!['statut']) {
                                                      Fluttertoast.showToast(
                                                        msg:
                                                            "${value['message']}",
                                                      );
                                                      setState(() {
                                                        _isloading2 = false;
                                                      });
                                                      Navigator.pop(context);
                                                      Navigator
                                                          .pushReplacementNamed(
                                                              context,
                                                              loginRoute);
                                                    } else {
                                                      Fluttertoast.showToast(
                                                        msg:
                                                            "${value['message']}",
                                                      );
                                                      setState(() {
                                                        _isloading2 = false;
                                                      });
                                                    }
                                                  });
                                                },
                                                child: Center(
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 25,
                                                        vertical: 10),
                                                    margin:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: blue_color),
                                                    child: _isloading2
                                                        ? Center(
                                                            child:
                                                                const CircularProgressIndicator(
                                                              color:
                                                                  scaffoldbackground,
                                                            ),
                                                          )
                                                        : Text(
                                                            getTranslated(
                                                                context,
                                                                'compte_modifier_button'),
                                                            style: TextStyle(
                                                                color:
                                                                    scaffoldbackground,
                                                                fontSize: 18),
                                                          ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }));
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
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: (() async {
                                var urll =
                                    "https://agc-assurances.com/reclamations/";
                                if (await canLaunch(urll)) {
                                  await launch(urll);
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Error: Cannot load Url",
                                  );
                                }
                              }),
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
                              onTap: () {
                                Navigator.pushNamed(context, apropos);
                              },
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

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectagc/components/widgets/navbarClient.dart';
import 'package:projectagc/services/localisation/localization_constant.dart';
import 'package:projectagc/main.dart';
import 'package:projectagc/models/classes/langages.dart';
import 'package:projectagc/components/routes/route_names.dart';
import 'package:projectagc/services/themes/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/bas.dart';

class HomeClientPage extends StatefulWidget {
  const HomeClientPage({super.key});

  @override
  State<HomeClientPage> createState() => _HomeClientPageState();
}

class _HomeClientPageState extends State<HomeClientPage> {
  void _changeLanguage(language langage) async {
    print(langage.languagecode);
    Locale? _temp = await setLocale(langage.languagecode);
    MyApp.setLocale(context, _temp);
  }

  @override
  void initState() {
    super.initState();
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              onChanged: (language? langage) {
                _changeLanguage(langage!);
              },
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.black,
              ),
              items: language
                  .languageList()
                  .map<DropdownMenuItem<language>>((lang) => DropdownMenuItem(
                        value: lang,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(lang.flag),
                            Text(lang.name),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 450,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 50,
                    child: Center(
                      child: Image.asset(
                        "assets/images/png/docvv.png",
                        height: 400,
                        width: 270,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 140.0, left: 50),
                              child: Container(
                                padding: const EdgeInsets.all(50),
                                margin: const EdgeInsets.only(
                                    left: 80, right: 10, top: 20),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0XF4682B4).withOpacity(0.6),
                                ),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        //'Requerir un bon de prise en charge',
                                        getTranslated(context, 'home_info'),
                                        style: GoogleFonts.poppins(
                                            color: AdaptiveTheme.of(context)
                                                .theme
                                                .primaryColor,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Center(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.all(10),
                                            fixedSize: Size(100, 100),
                                            shape: CircleBorder(),
                                            side: BorderSide(
                                                color: Colors.black12,
                                                width: 1),
                                            elevation: 10,
                                            shadowColor: Color(0XF4682B4)
                                                .withOpacity(0.7),
                                            primary: Color(0XF4682B4)
                                                .withOpacity(0.3)),
                                        onPressed: () {},
                                        child: Image.asset(
                                          "assets/images/png/doc2.png",
                                          height: 70,
                                          width: 70,
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
            GestureDetector(
              onTap: (() {
                Navigator.pushNamed(context, serviceRoute);
              }),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AdaptiveTheme.of(context).theme.primaryColor,
                  ),
                ),
                child: Center(
                  child: Text(
                    getTranslated(context, 'home_button1'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: AdaptiveTheme.of(context).theme.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (() async {
                var urll = "https://agc-assurances.com/reclamations/";
                if (await canLaunch(urll)) {
                  await launch(urll);
                } else {
                  Fluttertoast.showToast(
                    msg: "Error: Cannot load Url",
                  );
                }
              }),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AdaptiveTheme.of(context).theme.primaryColor,
                  ),
                ),
                child: Center(
                  child: Text(
                    getTranslated(context, 'home_button2'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: AdaptiveTheme.of(context).theme.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            bas(),
          ],
        ),
      ),
    );
  }
}

/** Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 140.0, left: 50),
                              child: Container(
                                padding: const EdgeInsets.all(40),
                                margin:
                                    const EdgeInsets.only(left: 80, right: 10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0XF4682B4).withOpacity(0.7),
                                ),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        //'Requerir un bon de prise en charge',
                                        getTranslated(context, 'home_info'),
                                        style: TextStyle(
                                          color: AdaptiveTheme.of(context)
                                              .theme
                                              .primaryColor,
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, bpcRoute);
                                      },
                                      child: Image.asset(
                                        "assets/images/png/doc2.png",
                                        height: 105,
                                        width: 130,
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
                  ), */
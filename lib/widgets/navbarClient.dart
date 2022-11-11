import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projectagc/localisation/localization_constant.dart';
import 'package:projectagc/providers/providerCustumer.dart';
import 'package:projectagc/routes/route_names.dart';
import 'package:projectagc/screens/loginPage/loginPage.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/providerUser.dart';
import '../themes/constants.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class NavBarClient extends StatefulWidget {
  const NavBarClient({super.key});

  @override
  State<NavBarClient> createState() => _NavBarClientState();
}

class _NavBarClientState extends State<NavBarClient> {
  var placeholder = "assets/images/png/profile.png";
  bool darkmode = false;
  dynamic savedThemeMode;
  @override
  void initState() {
    super.initState();
    getCurrentTheme();
  }

  Future getCurrentTheme() async {
    savedThemeMode = await AdaptiveTheme.getThemeMode();
    if (savedThemeMode.toString() == 'AdaptiveThemeMode.dark') {
      print('theme sombre');
      setState(() {
        darkmode = true;
      });
    } else {
      print('theme clair');
      setState(() {
        darkmode = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<ProviderCustumer>(builder: (context, auth, _) {
        return ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: blue_color),
              accountName: Row(
                children: [
                  Text(
                    getTranslated(context, 'nav_identifiant'),
                    style: TextStyle(color: scaffoldbackground),
                  ),
                  Text(
                    auth.user.identifiant,
                    style: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.white70),
                  ),
                ],
              ),
              accountEmail: Row(
                children: [
                  Text(
                    getTranslated(context, 'nav_email'),
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: scaffoldbackground,
                    ),
                  ),
                  Text(
                    auth.user.email,
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: placeholder,
                    image: auth.user.photo,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AdaptiveTheme.of(context).theme.primaryColor,
                ),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.person,
                  color: blue_color,
                ),
                title: Text(getTranslated(context, 'nav_compte')),
                onLongPress: () {
                  return;
                },
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, compteRoute);
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AdaptiveTheme.of(context).theme.primaryColor,
                ),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.list,
                  color: blue_color,
                ),
                title: Text(
                  getTranslated(context, 'nav_statut'),
                ),
                onLongPress: () {
                  return;
                },
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, statutRoute);
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AdaptiveTheme.of(context).theme.primaryColor,
                ),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.search_sharp,
                  color: blue_color,
                ),
                title: Text(
                  getTranslated(context, 'nav_historique'),
                ),
                onLongPress: () {
                  return;
                },
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, historiqueROute);
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AdaptiveTheme.of(context).theme.primaryColor,
                ),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.handshake,
                  color: blue_color,
                ),
                title: Text(getTranslated(context, 'nav_service')),
                onLongPress: () {
                  return;
                },
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, serviceRoute);
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: SwitchListTile(
                title: Text('Mode sombre'),
                secondary: Icon(
                  Icons.nightlight_round,
                  color: blue_color,
                ),
                value: darkmode,
                onChanged: (value) {
                  print(value);
                  if (value == true) {
                    AdaptiveTheme.of(context).setDark();
                  } else {
                    AdaptiveTheme.of(context).setLight();
                  }
                  setState(() {
                    darkmode = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                leading: const Icon(
                  Icons.design_services,
                  color: blue_color,
                ),
                title: Text(getTranslated(context, 'nav_question')),
                onTap: () async {
                  var urll = "https://agc-assurances.com/reclamations/";
                  if (await canLaunch(urll)) {
                    await launch(urll);
                  } else {
                    Fluttertoast.showToast(
                      msg: "Error: Cannot load Url",
                    );
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                leading: const Icon(
                  Icons.exit_to_app,
                  color: blue_color,
                ),
                title: Text(
                  getTranslated(context, 'nav_deconnexion'),
                  style: TextStyle(color: red_color),
                ),
                onLongPress: () {
                  return;
                },
                onTap: () {
                  auth.logOutUser().then(
                    (value) {
                      if (value!['status'] == true) {
                        Fluttertoast.showToast(
                          msg: "Message:${value['message']}",
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
                            },
                          ),
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: "Error:${value['message']}",
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}

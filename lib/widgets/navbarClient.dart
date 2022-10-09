import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projectagc/localisation/localization_constant.dart';
import 'package:projectagc/routes/route_names.dart';
import 'package:projectagc/screens/loginPage/loginPage.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/providerUser.dart';
import '../themes/constants.dart';

class NavBarClient extends StatelessWidget {
  const NavBarClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<AuthProvider>(builder: (context, auth, _) {
        return ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: blue_color),
              accountName: Row(
                children: [
                  Text(getTranslated(context, 'nav_identifiant')),
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
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  Text(
                    auth.user.email,
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    auth.user.photo,
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
                border: Border.all(color: blue_color),
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
                border: Border.all(color: blue_color),
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
                border: Border.all(color: blue_color),
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
                border: Border.all(color: blue_color),
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

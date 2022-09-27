import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectagc/themes/constants.dart';
import 'package:projectagc/widgets/navbarEntreprise.dart';

import '../../widgets/bas.dart';
import 'pageEntreprise/accueilPage.dart';
import 'pageEntreprise/listPages.dart';
import 'pageEntreprise/profilePageE.dart';

class HomeEntreprisePage extends StatefulWidget {
  const HomeEntreprisePage({super.key});

  @override
  State<HomeEntreprisePage> createState() => _HomeEntreprisePageState();
}

class _HomeEntreprisePageState extends State<HomeEntreprisePage> {
  var color1 = blue_color;
  var color2 = blue_color;
  var height1 = 15;
  var height2 = 20;
  String _texte = 'Accueil';
  int currentTab = 0;

  final List<Widget> screens = [
    AccueilPage(),
    ListPages(),
    ProfilePageE(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentPage = AccueilPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBarEntreprise(),
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
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: PageStorage(
        bucket: bucket,
        child: currentPage,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 82,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentPage = AccueilPage();
                          currentTab = 0;
                          _texte = 'Accueil';
                        });
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: currentTab == 0 ? blue_color : Colors.grey,
                            size: currentTab == 0 ? 38 : 29,
                          ),
                          Text(
                            'Accueil',
                            style: GoogleFonts.poppins(
                                color:
                                    currentTab == 0 ? blue_color : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentPage = ListPages();
                          currentTab = 1;
                          _texte = 'Listes';
                        });
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.list_alt,
                            color: currentTab == 1 ? blue_color : Colors.grey,
                            size: currentTab == 1 ? 38 : 29,
                          ),
                          Text(
                            'Listes',
                            style: GoogleFonts.poppins(
                                color:
                                    currentTab == 1 ? blue_color : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(
                          () {
                            currentPage = ProfilePageE();
                            currentTab = 2;
                            _texte = 'Profile';
                          },
                        );
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: currentTab == 2 ? blue_color : Colors.grey,
                            size: currentTab == 2 ? 38 : 28,
                          ),
                          Text(
                            'Profile',
                            style: GoogleFonts.poppins(
                                color:
                                    currentTab == 2 ? blue_color : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                bas()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

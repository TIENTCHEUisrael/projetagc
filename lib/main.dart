import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectagc/providers/providerUser.dart';
import 'package:projectagc/screens/homePage/homeClientPage.dart';
import 'package:projectagc/screens/navigationPage/navigationPage.dart';
import 'package:projectagc/themes/constants.dart';
import 'package:provider/provider.dart';

import 'providers/providerBpc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  //Locale? _locale;
  @override
  void initState() {
    //AuthProvider().logOutUser();
    super.initState();
  }

  /*void setlocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return AuthProvider();
          },
        ),
        ChangeNotifierProvider(create: (_) {
          return BPCProvider();
        }),
      ],
      child: Consumer<AuthProvider>(builder: (context, auth, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            //brightness: Brightness.dark,
            primaryColor: blue_color,
            scaffoldBackgroundColor: scaffoldbackground,
            textTheme: TextTheme(
              button: GoogleFonts.poppins(),
            ),
          ),
          title: 'Project Agc',
          home: auth.isAuth == true
              ? HomeClientPage()
              : FutureBuilder<bool>(
                  future: auth.tryAutoLogin(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Scaffold(
                          backgroundColor: Colors.white,
                          body: Center(
                            child: CircularProgressIndicator(
                              color: blue_color,
                            ),
                          ),
                        );
                      case ConnectionState.none:
                        return NavigationPage();
                      default:
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return NavigationPage();
                        }
                    }
                  },
                ),
        );
      }),
    );
  }
}

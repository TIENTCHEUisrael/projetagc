import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectagc/providers/providerUser.dart';
import 'package:projectagc/screens/homePage/homeClientPage.dart';
import 'package:projectagc/screens/splashPages/splashPage.dart';
import 'package:projectagc/themes/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return AuthProvider();
          },
        ),
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
                        return Scaffold(
                          backgroundColor: Colors.white,
                          body: Container(
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );

                      default:
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return SplashPage();
                        }
                    }
                  },
                ),
        );
      }),
    );
  }
}

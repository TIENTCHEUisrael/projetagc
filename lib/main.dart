import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectagc/localisation/localisation.dart';
import 'package:projectagc/providers/providerUser.dart';
import 'package:projectagc/screens/homePage/homeClientPage.dart';
import 'package:projectagc/screens/navigationPage/navigationPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projectagc/themes/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'providers/providerBpc.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setlocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  @override
  void initState() {
    //AuthProvider().logOutUser();
    super.initState();
    Future.delayed(Duration(seconds: 5))
        .then((value) => {FlutterNativeSplash.remove()});
  }

  void setlocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

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
          locale: _locale,
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
          supportedLocales: [
            Locale('en', 'US'),
            Locale('fr', 'FR'),
          ],
          localizationsDelegates: [
            DemoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (deviceLocale, supportedLocales) {
            for (var locale in supportedLocales) {
              if (locale.languageCode == deviceLocale!.languageCode &&
                  locale.countryCode == deviceLocale.countryCode) {
                return deviceLocale;
              }

              return supportedLocales.first;
            }
          },
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectagc/services/localisation/localization_constant.dart';
import 'package:projectagc/services/providers/providerCustumer.dart';
import 'package:projectagc/components/routes/route_names.dart';
import 'package:projectagc/services/themes/constants.dart';
import 'package:provider/provider.dart';
import '../../animations/buttonAnimation1.dart';
//import '../../providers/providerUser.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  var _obscureText = true;
  var _iconchange = Icon(
    Icons.visibility,
    color: Colors.black,
  );

  final identifiant = TextEditingController();
  final motdepasse = TextEditingController();

  void zero() {
    setState(() {
      identifiant.clear();
      motdepasse.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    identifiant.text = "2212131KaFo01890";
    motdepasse.text = "foyang";
  }

  @override
  Widget build(BuildContext context) {
    ProviderCustumer auth = Provider.of<ProviderCustumer>(context);
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            DelayedAnimation(
              delay: 100,
              child: Image.asset(
                "assets/images/png/agc2.png",
                height: 240,
                width: 240,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      getTranslated(context, 'login_title'),
                      style: GoogleFonts.poppins(fontSize: 17),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25.0,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: TextFormField(
                                  controller: identifiant,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: getTranslated(
                                        context, 'login_identifiant'),
                                    icon: Icon(Icons.person),
                                  ),
                                  keyboardType: TextInputType.name,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "S'il vous plait entrer votre Identifiant";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25.0,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: TextFormField(
                                  controller: motdepasse,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText:
                                        getTranslated(context, 'login_passe'),
                                    icon: const Icon(Icons.key),
                                    suffixIcon: IconButton(
                                      icon: _iconchange,
                                      onPressed: () {
                                        if (_obscureText == true) {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                            _iconchange = const Icon(
                                              Icons.visibility_off,
                                              color: Colors.black,
                                            );
                                          });
                                        } else {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                            _iconchange = const Icon(
                                              Icons.visibility,
                                              color: Colors.black,
                                            );
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                  keyboardType: TextInputType.name,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "S'il vous plait entrer votre mot de passe";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  getTranslated(context, 'login_passeoublier')),
                              InkWell(
                                child: const Text(
                                  'Changer mot de passe',
                                  style: TextStyle(color: blue_color),
                                ),
                                onTap: () => print('Ontapp'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              onTap: () {
                                final form = _formKey.currentState;
                                if (form!.validate()) {
                                  form.save();
                                  setState(() {
                                    isLoading = true;
                                  });
                                  final Future<Map<String, dynamic>?> response =
                                      auth.loginCustumer(
                                          identifiant.text, motdepasse.text);
                                  response.then(
                                    (value) {
                                      if (value!['statut']) {
                                        Fluttertoast.showToast(
                                          msg: "${value['message']}",
                                        );
                                        setState(() {
                                          isLoading = false;
                                        });
                                        /*Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return HomeClientPage();
                                        }));*/
                                        Navigator.pushReplacementNamed(
                                            context, homeRoute);
                                      } else {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        Fluttertoast.showToast(
                                          msg: "Error: ${value['message']}",
                                        );
                                      }
                                    },
                                  );
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: blue_color,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Center(
                                  child: isLoading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 1,
                                        )
                                      : Text(
                                          getTranslated(
                                              context, 'login_connexion'),
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

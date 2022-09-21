import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectagc/screens/homePage/homeClientPage.dart';
import 'package:projectagc/themes/constants.dart';

import '../../animations/buttonAnimation1.dart';
import '../../widgets/bas.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var _obscureText = true;
  var _iconchange = Icon(
    Icons.visibility,
    color: Colors.black,
  );

  final idenfifiant = TextEditingController();
  final motdepasse = TextEditingController();

  void zero() {
    setState(() {
      idenfifiant.clear();
      motdepasse.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: SingleChildScrollView(
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
                        'Salut et bon retour a vous!',
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
                                    controller: idenfifiant,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Identifiant',
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
                                      hintText: 'Mot de passe',
                                      icon: const Icon(Icons.key),
                                      suffixIcon: IconButton(
                                        icon: _iconchange,
                                        onPressed: () {
                                          if (_obscureText == true) {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                              _iconchange = Icon(
                                                Icons.visibility_off,
                                                color: Colors.black,
                                              );
                                            });
                                          } else {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                              _iconchange = Icon(
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
                                const Text('Mot de passe oublié? '),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: GestureDetector(
                                onTap: () {
                                  final form = _formKey.currentState;
                                  if (form!.validate()) {
                                    form.save();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return HomeClientPage();
                                        },
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: blue_color,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Connection',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              bas(),
            ],
          ),
        ),
      ),
    );
  }
}

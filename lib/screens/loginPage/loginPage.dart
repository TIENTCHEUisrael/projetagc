import 'package:flutter/material.dart';
import 'package:projectagc/themes/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/png/agc1.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(blue_color, BlendMode.darken)),
      ),
    );
  }
}

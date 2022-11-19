import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectagc/services/themes/constants.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Image.asset(
              'assets/images/png/agc1.png',
              height: 215,
              width: 250,
            ),
          ),
          Text(
            'Le gage de votre sécurité',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: blue_color, fontSize: 23),
            textAlign: TextAlign.center,
          ),
          Image.asset(
            'assets/images/png/agc2.png',
            height: 290,
            width: 450,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectagc/themes/constants.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset(
              'assets/images/jpeg/agc4.jpg',
              height: 300,
              width: 600,
            ),
          ),
          Text(
            'Une santé assurée pour une reussite assurée',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: blue_color, fontSize: 23),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

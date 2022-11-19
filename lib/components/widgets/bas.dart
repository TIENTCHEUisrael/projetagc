import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectagc/services/themes/constants.dart';

Widget bas() {
  return Container(
    padding: const EdgeInsets.all(5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'A',
          style: GoogleFonts.poppins(
            color: red_color,
          ),
        ),
        Text(
          'G',
          style: GoogleFonts.poppins(
            color: Colors.orange,
          ),
        ),
        Text(
          'C ',
          style: GoogleFonts.poppins(color: blue_color),
        ),
        Text(
          'version 1.0.0',
          style: GoogleFonts.poppins(),
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectagc/services/localisation/localization_constant.dart';
import 'package:projectagc/services/themes/constants.dart';

class AproposPage extends StatefulWidget {
  const AproposPage({super.key});

  @override
  State<AproposPage> createState() => _AproposPageState();
}

class _AproposPageState extends State<AproposPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue_color,
        leading: const BackButton(
          color: scaffoldbackground,
        ),
        title: Center(
          child: Text(
            getTranslated(context, 'compte_propos'),
            style: TextStyle(color: scaffoldbackground),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          Image.asset(
            "assets/images/png/agc1.png",
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    "assets/images/png/agc2.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'De fidelité nous vous disons Merci!',
                  style: GoogleFonts.poppins(
                    color: blue_color,
                    fontSize: 17,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                color: blue_color,
                height: 1,
                width: MediaQuery.of(context).size.width / 1.5,
              ),
              ListTile(
                title: Text(
                  getTranslated(context, 'apropos_titretext'),
                  style: GoogleFonts.poppins(
                    color: red_color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    getTranslated(context, 'apropos_text'),
                    textAlign: TextAlign.start,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

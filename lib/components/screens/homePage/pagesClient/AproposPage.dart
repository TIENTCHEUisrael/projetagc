import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectagc/components/widgets/bas.dart';
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
              ),
              Text(
                getTranslated(context, 'apropos_titretext1'),
                style: GoogleFonts.poppins(
                  color: blue_color,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width - 50,
                child: Column(
                  children: [
                    cardTheme(
                        number: '+ 20 ans',
                        fonttext:
                            "D'expérience sur le marché camerounais des assurances"),
                    cardTheme(
                        number: '+ 9 409 351 966',
                        fonttext: 'De Sinistres payés'),
                    cardTheme(
                        number: '+ 446', fonttext: 'De marge de solvabilité'),
                    cardTheme(
                        number: '+ 135',
                        fonttext:
                            'De taux de couverture des engagements règlementés'),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Evolution du Chiffres d’affaires de AGC',
                  style: GoogleFonts.poppins(color: blue_color, fontSize: 17),
                ),
              ),
              Image.asset("assets/images/png/statistique.png"),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                color: blue_color,
                height: 1,
                width: MediaQuery.of(context).size.width / 1.5,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: blue_color,
                      ),
                    ),
                    Container(
                      child: Text(
                        'LES RÉASSUREURS',
                        style: GoogleFonts.poppins(
                          color: blue_color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
                  'Le partenariat avec les réassureurs Internationaux renforce notre solvabilité et améliore la qualité de notre service. Pour mener à bien cette mission, nous nous sommes entourées des réassureurs de renom à l’instar de : AFRICA RE, TRUST RE, CICA-RE, CONTINANTAL-RE, ZEP-RE, NCARe, GHANARE, AVENI RE.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: blue_color,
                      ),
                    ),
                    Container(
                      child: Text(
                        'UNE DYNAMIQUE SOLIDE',
                        style: GoogleFonts.poppins(
                          color: blue_color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bas(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget cardTheme({required String number, required String fonttext}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Card(
      elevation: 0.5,
      child: ListTile(
        title: Text(
          number,
          style: GoogleFonts.poppins(color: red_color),
        ),
        subtitle: Text(
          fonttext,
          style: GoogleFonts.poppins(color: Colors.grey),
        ),
      ),
    ),
  );
}

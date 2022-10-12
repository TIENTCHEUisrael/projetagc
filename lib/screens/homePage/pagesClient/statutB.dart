import 'package:flutter/material.dart';
import 'package:projectagc/localisation/localization_constant.dart';
import '../../../themes/constants.dart';

class StatutBpc extends StatefulWidget {
  const StatutBpc({super.key});

  @override
  State<StatutBpc> createState() => _StatutBpcState();
}

class _StatutBpcState extends State<StatutBpc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue_color,
        title: Center(
          child: Text(
            getTranslated(context, 'statut_title'),
            style: TextStyle(color: scaffoldbackground),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          Image.asset(
            "assets/images/png/agc1.png",
            height: 40,
            width: 40,
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
                itemBuilder: (context, index) {
                  return CardWidget(
                      texte: "texte",
                      info: "info",
                      color: Colors.black,
                      image: Image.asset("assets/images/png/agc1.png"));
                },
                separatorBuilder: ((context, index) {
                  return Divider();
                }),
                itemCount: 10),
          ],
        ),
      ),
    );
  }
}

Widget CardWidget(
    {required String texte,
    required String info,
    required Color color,
    required Image image,
    Icon? icon}) {
  return Card(
    elevation: 10,
    child: ListTile(),
  );
}

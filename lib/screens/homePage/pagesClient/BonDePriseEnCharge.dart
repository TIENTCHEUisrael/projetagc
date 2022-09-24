import 'package:flutter/material.dart';

import '../../../themes/constants.dart';
import '../../../widgets/bas.dart';

class BonPriseCharge extends StatefulWidget {
  const BonPriseCharge({super.key});

  @override
  State<BonPriseCharge> createState() => _BonPriseChargeState();
}

class _BonPriseChargeState extends State<BonPriseCharge> {
  String? hostoChoose;
  List hostos = ["items1", "items2", "items3", "items4", "items5"];
  String? ville;
  List villes = ["ville1", "ville2", "ville3", "ville4", "ville5"];
  String? beneficiaire;
  List beneficiaires = ["bene1", "bene2"];
  String? partenaire;
  List partenaires = ["partenaire1", "partenaire2"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue_color,
        title: const Center(
          child: Text(
            'Bon de prise en charge',
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
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Type de local:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: blue_color),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: DropdownButton(
                    hint: const Text('Hopital, Laboratoir,Autre Prestataire'),
                    value: hostoChoose,
                    dropdownColor: Colors.white,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    iconSize: 36,
                    underline: SizedBox(),
                    //isExpanded: true,
                    style: TextStyle(color: blue_color),
                    onChanged: (newvalue) {
                      setState(() {
                        hostoChoose = newvalue.toString();
                      });
                    },
                    items: hostos.map(
                      (valueItem) {
                        return DropdownMenuItem(
                            value: valueItem, child: Text(valueItem));
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const Text(
              'Ville et bénéficiaire au choix:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: blue_color),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    margin: const EdgeInsets.only(left: 18),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: DropdownButton(
                      hint: const Text('Ville / City'),
                      value: ville,
                      dropdownColor: Colors.white,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      iconSize: 36,
                      underline: SizedBox(),
                      //isExpanded: true,
                      style: TextStyle(color: blue_color),
                      onChanged: (newvalue) {
                        setState(() {
                          ville = newvalue.toString();
                        });
                      },
                      items: villes.map(
                        (valueItem) {
                          return DropdownMenuItem(
                              value: valueItem, child: Text(valueItem));
                        },
                      ).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    margin: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: DropdownButton(
                      hint: const Text('Bénéficiaire'),
                      value: beneficiaire,
                      dropdownColor: Colors.white,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      iconSize: 36,
                      underline: SizedBox(),
                      //isExpanded: true,
                      style: TextStyle(color: blue_color),
                      onChanged: (newvalue) {
                        setState(() {
                          beneficiaire = newvalue.toString();
                        });
                      },
                      items: beneficiaires.map(
                        (valueItem) {
                          return DropdownMenuItem(
                              value: valueItem, child: Text(valueItem));
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              'Hopital,laboratoire... patenaire aux choix:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: blue_color),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: DropdownButton(
                    hint: const Text("Choix de l'hopital partenaire"),
                    value: partenaire,
                    dropdownColor: Colors.white,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    iconSize: 36,
                    underline: SizedBox(),
                    //isExpanded: true,
                    style: TextStyle(color: blue_color),
                    onChanged: (newvalue) {
                      setState(() {
                        partenaire = newvalue.toString();
                      });
                    },
                    items: partenaires.map(
                      (valueItem) {
                        return DropdownMenuItem(
                            value: valueItem, child: Text(valueItem));
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.only(top: 60, bottom: 60),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/png/agc2.png"),
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: blue_color),
              ),
              child: const Center(
                child: Text('Information sur le partenaire'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Le pourcentage de remboursement est de :',
                    style: TextStyle(fontSize: 15, color: blue_color),
                  ),
                  Text(
                    '80%',
                    style: TextStyle(color: red_color),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Formulaire a verifier',
                  style: TextStyle(color: blue_color),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                print('demande');
              },
              child: Card(
                elevation: 3.2,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                ),
                child: Container(
                  height: 90,
                  width: 90,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.share,
                    color: blue_color,
                    size: 60,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Center(
              child: Text(
                'Code unique du Bon :',
                style: TextStyle(color: blue_color),
              ),
            ),
            Center(
              child: Text(
                '3ED4F4ZD',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            bas()
          ],
        ),
      ),
    );
  }
}

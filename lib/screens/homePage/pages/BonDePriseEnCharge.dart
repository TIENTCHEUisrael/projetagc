import 'package:flutter/material.dart';

import '../../../themes/constants.dart';

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
          ],
        ),
      ),
    );
  }
}

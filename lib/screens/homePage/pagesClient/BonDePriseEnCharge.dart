import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projectagc/models/BonDePriseEnCharge/coupon.dart';
import 'package:projectagc/models/BonDePriseEnCharge/locale.dart';
import 'package:projectagc/providers/providerBpc.dart';
import 'package:projectagc/widgets/popup.dart';
import 'package:provider/provider.dart';

import '../../../animations/custum.dart';
import '../../../providers/providerUser.dart';
import '../../../themes/constants.dart';
import '../../../widgets/bas.dart';
import '../../../widgets/pageRoute.dart';

class BonPriseCharge extends StatefulWidget {
  const BonPriseCharge({super.key});

  @override
  State<BonPriseCharge> createState() => _BonPriseChargeState();
}

class _BonPriseChargeState extends State<BonPriseCharge> {
  bool value = false;
  List<Locales>? _locales;
  bool _isloading = true;
  bool _isgetting = false;
  Locales? locale;
  String? ville;
  String? beneficiaire;
  List beneficiaires = ["bene1", "bene2"];
  String? partenaire;
  List partenaires = ["partenaire1", "partenaire2"];
  @override
  void initState() {
    super.initState();
    getLocales();
  }

  Future<void> getLocales() async {
    _locales = await BPCProvider.getlocales();
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    BPCProvider bpcProvider = Provider.of<BPCProvider>(context);
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
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Consumer<AuthProvider>(builder: (context, auth, _) {
                return Column(
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
                          child: IgnorePointer(
                            ignoring: false,
                            child: DropdownButton(
                              hint: const Text(
                                  'Hopitals, Laboratoires,Autre Prestataire'),
                              value: locale,
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
                                  locale = newvalue;
                                });
                              },
                              items: _locales!.map(
                                (valueItem) {
                                  return DropdownMenuItem(
                                      value: valueItem,
                                      child: Text(valueItem.nom));
                                },
                              ).toList(),
                            ),
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
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            padding: const EdgeInsets.only(left: 8),
                            margin: const EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(15)),
                            child: IgnorePointer(
                              ignoring: false,
                              child: DropdownButton(
                                hint: const Text('Ville'),
                                value: ville,
                                dropdownColor: Colors.white,
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                ),
                                iconSize: 30,
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
                                        value: valueItem,
                                        child: Text(valueItem));
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            margin: const EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(15)),
                            child: IgnorePointer(
                              ignoring: false,
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
                                        value: valueItem,
                                        child: Text(valueItem));
                                  },
                                ).toList(),
                              ),
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
                          child: IgnorePointer(
                            ignoring: false,
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.only(top: 70, bottom: 70),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage("assets/images/png/agc2.png"),
                          colorFilter: new ColorFilter.mode(
                            Colors.white.withOpacity(0.1),
                            BlendMode.dstATop,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: blue_color),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Center(
                              child: Text('Information sur le partenaire'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Le pourcentage de remboursement est de :',
                            style: TextStyle(fontSize: 15, color: blue_color),
                          ),
                          Text(
                            '${auth.user.remise}%',
                            style: TextStyle(color: red_color),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Checkbox(
                          value: this.value,
                          onChanged: (values) {
                            setState(() {
                              this.value = values!;
                            });
                          },
                        ),
                        Text(
                          'Formulaire a verifier',
                          style: TextStyle(color: blue_color),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        if (ville!.isNotEmpty || partenaire!.isNotEmpty) {
                          var coupon = Coupon(
                              ville: ville!,
                              partenaire: 1,
                              identifiantclient: auth.user.identifiant);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              });

                          final Future<Map<String, dynamic>?> response1 =
                              bpcProvider.generateCoupon(coupon);

                          response1.then((value) {
                            if (value!['statut']) {
                              Fluttertoast.showToast(
                                msg: "message ${value['message']}",
                              );
                              setState(() {
                                _isgetting = true;
                              });
                              /*final Future<
                                  Map<String,
                                      dynamic>?> response2 = bpcProvider.sendEmail(
                                  "AGC assurance",
                                  "Coupon",
                                  auth.user.nom,
                                  "Ton coupon pour le bon de prise en charge est : ${bpcProvider.getCoupon}",
                                  auth.user.email);

                              response2.then((value1) {
                                if (value1!['statut']) {
                                  Fluttertoast.showToast(
                                    msg:
                                        "message ${value['message']} and ${value1['message']}",
                                  );
                                  setState(() {
                                    _isgetting = true;
                                  });
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                    context,
                                    HeroDialogRoute(
                                      builder: (context) {
                                        return CouponPopup(
                                          contain: Column(
                                            children: [
                                              Container(
                                                child: Center(
                                                  child: Text(
                                                      'Votre coupon est : ${bpcProvider.getCoupon}'),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context).pop();
                                                },
                                                child: Card(
                                                  elevation: 5,
                                                  child: Text(
                                                    'OK',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: blue_color),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                    msg:
                                        "Error ${value['message']} and ${value1['message']}",
                                  );
                                }
                              });*/
                              Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                HeroDialogRoute(
                                  builder: (context) {
                                    return CouponPopup(
                                      contain: Column(
                                        children: [
                                          Container(
                                            child: Center(
                                              child: Text(
                                                  'Votre coupon est : ${bpcProvider.getCoupon}'),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).pop();
                                            },
                                            child: Card(
                                              elevation: 5,
                                              child: Text(
                                                'OK',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: blue_color),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else {
                              Fluttertoast.showToast(
                                msg: "message ${value['message']}",
                              );
                              Navigator.of(context).pop();
                            }
                          });
                        } else {
                          Fluttertoast.showToast(
                            msg: "error: Enter the information",
                          );
                        }
                      },
                      child: Hero(
                        tag: herosystem,
                        createRectTween: (begin, end) {
                          return CustomRectTween(begin: begin!, end: end!);
                        },
                        child: Card(
                          elevation: 3.2,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                          ),
                          child: Container(
                            height: 85,
                            width: 85,
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.share,
                              color: blue_color,
                              size: 60,
                            ),
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
                      child: _isgetting
                          ? Text(
                              bpcProvider.getCoupon,
                              style: TextStyle(color: Colors.grey),
                            )
                          : Text(
                              '-  -  -',
                              style: TextStyle(color: Colors.grey),
                            ),
                    ),
                    bas()
                  ],
                );
              }),
            ),
    );
  }
}

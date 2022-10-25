import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projectagc/localisation/localization_constant.dart';
import 'package:projectagc/models/BonDePriseEnCharge/coupon.dart';
import 'package:projectagc/models/BonDePriseEnCharge/institution.dart';
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
  Locales? locale;
  List<Institutions>? _intitutions;
  List<Institutions>? _intitutionss;
  Institutions? partenaire;
  bool _isloading = true;
  bool _isgetting = false;
  String? ville;
  String? beneficiaire;
  List beneficiaires = ["bene1", "bene2"];

  bool t1 = true;
  bool t2 = true;
  bool t3 = true;
  bool button = true;
  bool getPartenaire = false;
  @override
  void initState() {
    super.initState();
    getLocales();
    getall();
  }

  Future<void> getLocales() async {
    _locales = await BPCProvider.getlocales();
    setState(() {
      _isloading = false;
    });
  }

  Future<void> getpartenaires(Locales l, String s) async {
    _intitutions = await BPCProvider.getPartenaireByVilleLocale(l, s);
    setState(() {
      getPartenaire = true;
    });
  }

  Future<void> getall() async {
    _intitutionss = await BPCProvider.getAllPartenaires();
  }

  @override
  Widget build(BuildContext context) {
    BPCProvider bpcProvider = Provider.of<BPCProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue_color,
        title: Center(
          child: Text(
            getTranslated(context, 'bpc_title'),
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
          ? Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    getTranslated(context, "bpc_chargement"),
                  )
                ],
              ),
            )
          : SingleChildScrollView(
              child: Consumer<AuthProvider>(builder: (context, auth, _) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      getTranslated(context, 'bpc_type'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: AdaptiveTheme.of(context).theme.primaryColor,
                      ),
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
                              hint: Text(
                                getTranslated(context, 'bpc_type_choice'),
                                style: TextStyle(color: Colors.black),
                              ),
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
                                  t1 = false;
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
                    Text(
                      getTranslated(context, 'bpc_ville'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: AdaptiveTheme.of(context).theme.primaryColor,
                      ),
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
                              ignoring: t1,
                              child: DropdownButton(
                                hint: t1
                                    ? Text(
                                        getTranslated(
                                            context, 'bpc_ville_choice'),
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    : Text(
                                        getTranslated(
                                            context, 'bpc_ville_choice'),
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                value: ville,
                                dropdownColor: Colors.white,
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                ),
                                iconSize: 30,
                                underline: SizedBox(),
                                //isExpanded: true,
                                style: TextStyle(
                                  color: AdaptiveTheme.of(context)
                                      .theme
                                      .primaryColor,
                                ),
                                onChanged: (newvalue) {
                                  setState(() {
                                    ville = newvalue.toString();
                                    t2 = false;
                                    t3 = false;
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
                              ignoring: t2,
                              child: DropdownButton(
                                hint: t2
                                    ? Text(
                                        getTranslated(
                                            context, 'bpc_beneficiaire'),
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    : Text(
                                        getTranslated(
                                            context, 'bpc_beneficiaire'),
                                        style: TextStyle(color: Colors.black),
                                      ),
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
                    Text(
                      getTranslated(context, 'bpc_partenaire'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: AdaptiveTheme.of(context).theme.primaryColor,
                      ),
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
                            ignoring: t3,
                            child: DropdownButton(
                                hint: t3
                                    ? Text(
                                        getTranslated(
                                            context, 'bpc_partenaire_choice'),
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    : Text(
                                        getTranslated(
                                            context, 'bpc_partenaire_choice'),
                                        style: TextStyle(color: Colors.black),
                                      ),
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
                                    partenaire = newvalue;
                                    button = false;
                                    getPartenaire = true;
                                  });
                                },
                                items: _intitutionss!.map(
                                  (val) {
                                    print(getPartenaire);
                                    return DropdownMenuItem(
                                        value: val, child: Text(val.name));
                                  },
                                ).toList()),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 250,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      /*padding: const EdgeInsets.only(top: 70, bottom: 70),*/
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
                      child: getPartenaire
                          ? SingleChildScrollView(
                              child: t3
                                  ? Center(
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Center(
                                            child: Text('Information'),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Informations Partenaire',
                                          style: TextStyle(
                                              color: blue_color, fontSize: 15),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text('Nom du Locale partenaire : '),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              partenaire!.name,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text('Description : '),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              partenaire!.description,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text('Ville : '),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              partenaire!.ville,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text('Numero a contacter : '),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '. . .',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
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
                            getTranslated(context, 'bpc_pourcentage'),
                            style: TextStyle(
                              fontSize: 15,
                              color:
                                  AdaptiveTheme.of(context).theme.primaryColor,
                            ),
                          ),
                          Text(
                            '${auth.user.remise}%',
                            style: TextStyle(color: red_color),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    IgnorePointer(
                      ignoring: button,
                      child: GestureDetector(
                        onTap: getPartenaire
                            ? () {
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
                                      msg: "Error: ${value['message']}",
                                    );
                                    Navigator.of(context).pop();
                                  }
                                });
                              }
                            : () {
                                print("object");
                                Fluttertoast.showToast(
                                  msg:
                                      "Error: Certainés valeurs sont mal indexé}",
                                );
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
                              child:
                                  Image.asset("assets/images/png/partage.png"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        getTranslated(context, 'bpc_code'),
                        style: TextStyle(
                          color: AdaptiveTheme.of(context).theme.primaryColor,
                        ),
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

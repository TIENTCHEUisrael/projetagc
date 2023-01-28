import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projectagc/components/widgets/popup.dart';
import 'package:projectagc/services/localisation/localization_constant.dart';
import 'package:projectagc/models/BonDePriseEnCharge/coupon.dart';
import 'package:projectagc/models/BonDePriseEnCharge/institution.dart';
import 'package:projectagc/models/BonDePriseEnCharge/locale.dart';
import 'package:projectagc/models/beneficiaire/beneficiaire.dart';
import 'package:projectagc/services/providers/providerBpc.dart';
import 'package:projectagc/services/providers/providerCustumer.dart';
import 'package:projectagc/services/themes/constants.dart';
import 'package:provider/provider.dart';
import '../../../animations/custum.dart';
import '../../../widgets/bas.dart';
import '../../../widgets/pageRoute.dart';

class BonPriseCharge extends StatefulWidget {
  const BonPriseCharge({super.key});

  @override
  State<BonPriseCharge> createState() => _BonPriseChargeState();
}

class _BonPriseChargeState extends State<BonPriseCharge> {
  bool value = false;
  List<dynamic>? town;
  String? ville;
  List<Locales>? _locales;
  Locales? locale;
  List<Institutions>? _intitutionss;
  Institutions? partenaire;
  bool _isloading = true;
  bool _isloading2 = true;
  bool _isgetting = false;
  Beneficiaire? beneficiaire;
  String numberBeneficiaire = '-1';

  bool t1 = true;
  bool t2 = true;
  bool t3 = true;
  bool t4 = true;
  bool t5 = true;
  bool button = true;
  bool getPartenaire = false;
  @override
  void initState() {
    super.initState();
    getLocales();
    gettown();
  }

  Future<void> getLocales() async {
    print("..........Get Locale...........");
    _locales = await BPCProvider.getlocales();
  }

  Future<void> gettown() async {
    town = await BPCProvider.getTowns();
    setState(() {
      _isloading = false;
    });
  }

  Future<void> getpartner(String t) async {
    _intitutionss = await BPCProvider.getPatnersByTown(t);
    setState(() {
      _isloading2 = false;
    });
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
              child: Consumer<ProviderCustumer>(builder: (context, auth, _) {
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
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  color: blue_color,
                                ),
                                onChanged: (newvalue) {
                                  setState(() {
                                    ville = newvalue.toString();
                                    t1 = true;
                                    t2 = false;
                                    t3 = false;
                                  });
                                  getpartner(ville!);
                                },
                                items: town!.map(
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
                                    beneficiaire = newvalue;
                                  });
                                },
                                items: auth.beneficiaires.map(
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
                    _isloading2
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: IgnorePointer(
                                  ignoring: t3,
                                  child: Icon(Icons.arrow_right),
                                ),
                              ),
                            ),
                          )
                        : Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(15)),
                                child: IgnorePointer(
                                  ignoring: t3,
                                  child: DropdownButton(
                                      hint: t3
                                          ? Text(
                                              getTranslated(context,
                                                  'bpc_partenaire_choice'),
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )
                                          : Text(
                                              getTranslated(context,
                                                  'bpc_partenaire_choice'),
                                              style: TextStyle(
                                                  color: Colors.black),
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
                                          t4 = false;
                                          button = false;
                                          getPartenaire = true;
                                        });
                                      },
                                      items: _intitutionss!.map(
                                        (val) {
                                          print(getPartenaire);
                                          return DropdownMenuItem(
                                              value: val,
                                              child: Text(val.name));
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
                              child: t4
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
                                  : SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            getTranslated(context, 'partner'),
                                            style: TextStyle(
                                                color: blue_color,
                                                fontSize: 15),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          ListTile(
                                            title: Text(
                                              getTranslated(
                                                  context, 'partner_name'),
                                            ),
                                            subtitle: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2, left: 35),
                                              child: Text(partenaire!.name),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              getTranslated(
                                                  context, 'partner_desc'),
                                            ),
                                            subtitle: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2, left: 40),
                                              child:
                                                  Text(partenaire!.description),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              getTranslated(
                                                  context, 'partner_town'),
                                            ),
                                            subtitle: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2, left: 50),
                                              child: Text(partenaire!.ville),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              getTranslated(
                                                  context, 'partner_number'),
                                            ),
                                            subtitle: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2, left: 45),
                                              child: Text(partenaire!
                                                  .institutionId
                                                  .toString()),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                            )
                          : Center(
                              child: Text(
                                getTranslated(context, 'partner'),
                                style: TextStyle(fontSize: 15),
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
                                for (var i in auth.beneficiaires) {
                                  if (beneficiaire == i) {
                                    setState(() {
                                      numberBeneficiaire =
                                          i.idBeneficiaire!.toString();
                                    });
                                  } else if (beneficiaire == null) {
                                    setState(() {
                                      numberBeneficiaire = '-1';
                                    });
                                  }
                                }
                                print(
                                    "+++++++++++++++++++++$numberBeneficiaire++++++++++++++++");
                                var coupon = Coupon(
                                    ville: ville!,
                                    partenaire: partenaire!.id,
                                    identifiantclient: auth.user.identifiant,
                                    beneficial: numberBeneficiaire);
                                print(coupon.toString());
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
                                      t1 = true;
                                      t3 = true;
                                      t5 = true;
                                      button = true;
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
                                                  child: Container(
                                                    height: 50,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: blue_color),
                                                    child: Center(
                                                      child: Text(
                                                        ' OK ',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                scaffoldbackground),
                                                      ),
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

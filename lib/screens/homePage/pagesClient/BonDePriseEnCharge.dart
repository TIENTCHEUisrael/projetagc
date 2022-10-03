import 'package:flutter/material.dart';
import 'package:projectagc/models/BonDePriseEnCharge/locale.dart';
import 'package:projectagc/providers/providerBpc.dart';
import 'package:provider/provider.dart';

import '../../../providers/providerUser.dart';
import '../../../themes/constants.dart';
import '../../../widgets/bas.dart';

class BonPriseCharge extends StatefulWidget {
  const BonPriseCharge({super.key});

  @override
  State<BonPriseCharge> createState() => _BonPriseChargeState();
}

class _BonPriseChargeState extends State<BonPriseCharge> {
  bool value = false;
  List<Locales>? _locales;
  bool _isloading = true;
  String? hostoChoose;
  String? ville;
  List villes = ["ville1", "ville2", "ville3", "ville4", "ville5"];
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
                                  'Hopital, Laboratoire,Autre Prestataire'),
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
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            margin: const EdgeInsets.only(left: 18),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Villes",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showSearch(
                                        context: context,
                                        delegate: Mysearch(),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.search,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                  )
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            margin: const EdgeInsets.only(left: 5),
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
                      child: const Center(
                        child: Text('Information sur le partenaire'),
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
                );
              }),
            ),
    );
  }
}

class Mysearch extends SearchDelegate {
  String? value;
  String get values {
    return value!;
  }

  List<String> searchresults = [
    "Bafia",
    "Bafoussam",
    "Bamenda",
    "Buea",
    "Douala",
    "Kribi",
    "Kumba",
    "Ringo",
    "Tibati",
    "Bankim",
    "Banyo",
    "Bélel",
    "Djohong",
    "Kontcha",
    "Mayo-Banyo",
    "Meïganga",
    "Ngaoundéré",
    "Somié",
    "Tignère",
    "Vina",
    "Akono",
    "Akonolinga",
    "Eséka",
    "Essé",
    "Évodoula",
    "Mbalmayo",
    "Mbam-Et-Inoubou",
    "Mbandjok",
    "Mbankomo",
    "Mefou-et-Akono",
    "Mfoundi",
    "Minta",
    "Nanga Eboko",
    "Ndikiniméki",
    "Ngomedzap",
    "Ngoro",
    "Nkoteng",
    "Ntui",
    "Obala",
    "Okoa",
    "Okola",
    "Ombésa",
    "Saa",
    "Yaoundé",
    "Yoko",
    "Abong Mbang",
    "Batouri",
    "Bélabo",
    "Bertoua",
    "Bétaré Oya",
    "Dimako",
    "Doumé",
    "Garoua Boulaï",
    "Mbang",
    "Ndelele",
    "Yokadouma",
    "Bogo",
    "Kaélé",
    "Kousséri",
    "Koza",
    "Makary",
    "Maroua",
    "Mayo-Sava",
    "Mayo-Tsanaga",
    "Mindif",
    "Mokolo",
    "Mora",
    "Yagoua",
    "Bonabéri",
    "Diang",
    "Dibombari",
    "Dizangué",
    "Edéa",
    "Loum",
    "Manjo",
    "Mbanga",
    "Melong",
    "Mouanko",
    "Ndom",
    "Ngambé",
    "Nkongsamba",
    "Penja",
    "Yabassi",
    "Faro Department",
    "Garoua",
    "Guider",
    "Lagdo",
    "Mayo-Louti",
    "Mayo-Rey",
    "Pitoa",
    "Poli",
    "Rey Bouba",
    "Tcholliré",
    "Babanki",
    "Bali",
    "Batibo",
    "Belo",
    "Boyo",
    "Fundong",
    "Jakiri",
    "Kumbo",
    "Mbengwi",
    "Mme-Bafumen",
    "Njinikom",
    "Wum",
    "Akom II",
    "Ambam",
    "Ébolowa",
    "Lolodorf",
    "Mvangué",
    "Mvila",
    "Sangmélima",
    "Bamusso",
    "Bekondo",
    "Fako Division",
    "Fontem",
    "Lebialem",
    "Limbe",
    "Mamfe",
    "Mundemba",
    "Mutengene",
    "Muyuka",
    "Nguti",
    "Tiko",
    "Bafang",
    "Bamendjou",
    "Bana",
    "Bandjoun",
    "Bangangté",
    "Bansoa",
    "Bazou",
    "Dschang",
    "Foumban",
    "Foumbot",
    "Hauts-Plateaux",
    "Koung-Khi",
    "Mbouda",
    "Ngou",
    "Noun",
    "Tonga"
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = "";
          }
        },
        icon: Icon(
          Icons.clear,
          color: Colors.black,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    value = query;
    return Center(
      child: Text(
        query,
        style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchresults.where((search) {
      final result = search.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}

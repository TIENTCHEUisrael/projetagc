import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectagc/models/statutCoupons/statutC.dart';
import 'package:projectagc/models/user/user.dart';
import 'package:projectagc/services/localisation/localization_constant.dart';
import 'package:projectagc/services/providers/providerBpc.dart';
import 'package:projectagc/services/themes/constants.dart';

class StatutBpc extends StatefulWidget {
  User user;
  StatutBpc({required this.user});

  @override
  State<StatutBpc> createState() => _StatutBpcState();
}

class _StatutBpcState extends State<StatutBpc> {
  StatutC c = StatutC(
      idStatut: "idStatut",
      nom: "nom",
      prenom: "prenom",
      telephone: "232323",
      category: "category",
      identifiantCustumer: "identifiantCustumer",
      sickness: "sickness",
      status: "status",
      doctor: "doctor",
      coupon: "coupon",
      amount: "amount",
      type: "type",
      createdAt: "createdAt",
      namePartenaire: "namePartenaire",
      villePartenaire: "villePartenaire",
      descriptionPartenaire: "descriptionPartenaire");
  bool _isloading = true;
  List<StatutC>? result;
  String? identifiant;
  User? _user;
  String? _link;

  @override
  void initState() {
    super.initState();
    getStatus();
  }

  Future<void> getStatus() async {
    result = await BPCProvider.getStatuts(widget.user.identifiant);
    print(result);
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue_color,
        title: Center(
          child: Text(
            getTranslated(context, 'statut_titre'),
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
              child: const CircularProgressIndicator(
                strokeWidth: 1,
              ),
            )
          : result!.isEmpty
              ? /*Center(
                  child: Text(
                    getTranslated(context, 'no_items'),
                    style: GoogleFonts.poppins(color: blue_color),
                  ),
                )*/
              cardWidget(res: c)
              : ListView.builder(
                  itemCount: result!.length,
                  itemBuilder: (((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: cardWidget(res: result![index]),
                    );
                  })),
                ),
    );
  }

  Widget cardWidget({required StatutC res}) {
    double? _progress;
    return InkWell(
      onTap: () {
        print('tapp this');
      },
      child: Card(
        elevation: 2.5,
        child: ListTile(
          title: Row(
            children: [
              Text(
                getTranslated(context, 'statut_coupon'),
              ),
              Text(
                res.coupon,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          subtitle: Column(
            children: [
              Text(
                getTranslated(context, 'statut_nom') + res.namePartenaire,
              ),
              Text(
                getTranslated(context, 'statut_ville') + res.villePartenaire,
              ),
            ],
          ),
          leading: Icon(
            Icons.gpp_good_sharp,
            color: blue_color,
          ),
          trailing: res.status == "On analysis"
              ? const Text(
                  "En analyse..",
                  style: TextStyle(color: Colors.blue),
                )
              : res.status == "Rejected"
                  ? const Text(
                      "Rejected",
                      style: TextStyle(color: Colors.red),
                    )
                  : Column(
                      children: [
                        const Text(
                          "Validated",
                          style: TextStyle(color: Colors.green),
                        ),
                        _progress != null
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 1,
                              )
                            : GestureDetector(
                                onTap: () async {
                                  _link = await BPCProvider.downoaldpdf(res);
                                  if (_link!.isNotEmpty) {
                                    FileDownloader.downloadFile(
                                        url: _link!.trim(),
                                        onProgress: ((fileName, progress) {
                                          setState(() {
                                            _progress = progress;
                                          });
                                        }),
                                        onDownloadCompleted: (value) {
                                          print("$value");
                                          Fluttertoast.showToast(
                                            msg: "Your path:$value",
                                          );
                                          setState(() {
                                            _progress = null;
                                          });
                                        });
                                  } else {
                                    print('error');
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                  ),
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: red_color,
                                  ),
                                  child: Text(
                                    'Downoald',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 9),
                                  ),
                                ),
                              ),
                      ],
                    ),
        ),
      ),
    );
  }
}

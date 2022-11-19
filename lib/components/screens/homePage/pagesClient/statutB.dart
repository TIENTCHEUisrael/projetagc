import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectagc/models/statutCoupons/statutC.dart';
import 'package:projectagc/models/user/user.dart';
import 'package:projectagc/services/localisation/localization_constant.dart';
import 'package:projectagc/services/providers/providerBpc.dart';
import 'package:projectagc/services/providers/providerCustumer.dart';
import 'package:projectagc/services/themes/constants.dart';

class StatutBpc extends StatefulWidget {
  const StatutBpc({super.key});

  @override
  State<StatutBpc> createState() => _StatutBpcState();
}

class _StatutBpcState extends State<StatutBpc> {
  bool _isloading = true;
  List<StatutC>? result;
  String? identifiant;
  User? _user;

  @override
  void initState() {
    super.initState();
    getStatus();
  }

  Future<void> getStatus() async {
    _user = await ProviderCustumer().user;
    await BPCProvider.getStatuts(_user!.identifiant).then((value) {
      if (value!['status']) {
        setState(() {
          result = value['result'];
          _isloading = false;
        });
      } else {
        Fluttertoast.showToast(msg: value['message']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isloading
        ? Center(
            child: const CircularProgressIndicator(
              strokeWidth: 1,
            ),
          )
        : result == []
            ? Center(
                child: Text(
                  'No items there',
                  style: GoogleFonts.poppins(color: blue_color),
                ),
              )
            : ListView.builder(
                itemCount: result!.length,
                itemBuilder: (((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: cardWidget(res: result![index]),
                  );
                })),
              );
  }

  Widget cardWidget({required StatutC res}) {
    return InkWell(
      onTap: () {
        print('tapp this');
      },
      child: Card(
        elevation: 0.5,
        child: ListTile(
          title: Row(children: [
            Text(
              getTranslated(context, 'statut_coupon'),
              style: GoogleFonts.poppins(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              '  ${res.coupon}',
              style: TextStyle(fontStyle: FontStyle.italic),
            )
          ]),
          subtitle: Column(
            children: [
              Row(
                children: [
                  Text(getTranslated(context, 'statut_identifiant'),
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 2,
                  ),
                  Text(res.identifiantCustumer)
                ],
              ),
              Row(
                children: [
                  Text(getTranslated(context, 'statut_nom'),
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 2,
                  ),
                  Text(res.nom + ' ' + res.prenom)
                ],
              ),
              Row(
                children: [
                  Text(getTranslated(context, 'statut_telephone'),
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 2,
                  ),
                  Text(res.telephone)
                ],
              ),
            ],
          ),
          leading: Icon(
            Icons.share,
            color: red_color,
            size: 18,
          ),
          trailing: res.status == "On analysis"
              ? const Text(
                  "En analyse..",
                  style: TextStyle(color: Colors.blue),
                )
              : res.status == "refused"
                  ? const Text(
                      "Refused",
                      style: TextStyle(color: Colors.red),
                    )
                  : const Text(
                      "Finished",
                      style: TextStyle(color: Colors.green),
                    ),
        ),
      ),
    );
  }
}

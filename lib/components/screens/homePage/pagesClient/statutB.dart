import 'package:flutter/material.dart';
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
    result = await BPCProvider.getStatuts(widget.user.identifiant);
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
                ),
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
          title: Text(
            getTranslated(context, 'statut_coupon') + '  ${res.coupon}',
          ),
          subtitle: Column(
            children: [
              Text('Identifiant :' + res.identifiantCustumer),
              Text(getTranslated(context, 'statut_nom') +
                  res.nom +
                  ' ' +
                  res.prenom),
              Text(getTranslated(context, 'statut_telephone') + res.telephone),
            ],
          ),
          leading: Icon(
            Icons.share,
            color: red_color,
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

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projectagc/models/statutCoupons/statutC.dart';
import 'package:projectagc/models/user/user.dart';
import 'package:projectagc/services/localisation/localization_constant.dart';
import 'package:projectagc/services/providers/providerBpc.dart';
import 'package:projectagc/services/providers/providerCustumer.dart';
import 'package:projectagc/services/themes/constants.dart';
import 'package:provider/provider.dart';

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
    return Container();
  }
}

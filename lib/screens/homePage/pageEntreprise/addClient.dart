import 'package:flutter/material.dart';

import '../../../themes/constants.dart';

class AddCompte extends StatefulWidget {
  const AddCompte({super.key});

  @override
  State<AddCompte> createState() => _AddCompteState();
}

class _AddCompteState extends State<AddCompte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue_color,
        title: const Center(
          child: Hero(
            tag: 'herotag',
            child: Text(
              'Ajouter Compte',
              style: TextStyle(color: scaffoldbackground),
              textAlign: TextAlign.center,
            ),
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
          /*IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.e_mobiledata,
              color: Colors.transparent,
            ),
          ),*/
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Text('dssdf'),
        ),
      ),
    );
  }
}

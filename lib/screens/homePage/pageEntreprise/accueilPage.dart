import 'package:flutter/material.dart';

import '../../../themes/constants.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbackground,
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Text('sdfdsf'),
          ),
        ]),
      ),
    );
  }
}

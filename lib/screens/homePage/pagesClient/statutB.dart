import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../themes/constants.dart';

class StatutBpc extends StatefulWidget {
  const StatutBpc({super.key});

  @override
  State<StatutBpc> createState() => _StatutBpcState();
}

class _StatutBpcState extends State<StatutBpc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue_color,
        title: const Center(
          child: Text(
            'Statut Bon de prix en charge',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text('Statut'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ListClientPage extends StatefulWidget {
  const ListClientPage({super.key});

  @override
  State<ListClientPage> createState() => _ListClientPageState();
}

class _ListClientPageState extends State<ListClientPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Center(
          child: Text('sdfdsf'),
        ),
      ]),
    );
  }
}

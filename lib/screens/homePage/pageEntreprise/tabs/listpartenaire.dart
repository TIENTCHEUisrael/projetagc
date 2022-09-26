import 'package:flutter/material.dart';

class ListPartenairePage extends StatefulWidget {
  const ListPartenairePage({super.key});

  @override
  State<ListPartenairePage> createState() => _ListPartenairePageState();
}

class _ListPartenairePageState extends State<ListPartenairePage> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: []),
    );
  }
}

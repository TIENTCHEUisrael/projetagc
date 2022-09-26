import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providerUser.dart';
import '../../../../themes/constants.dart';

class ListPartenairePage extends StatefulWidget {
  const ListPartenairePage({super.key});

  @override
  State<ListPartenairePage> createState() => _ListPartenairePageState();
}

class _ListPartenairePageState extends State<ListPartenairePage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Consumer<AuthProvider>(builder: (context, cours, _) {
            return Container(
              padding: const EdgeInsets.all(5),
              child: ListView.separated(
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {},
                      child: cardPartenaire(),
                    );
                  }),
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                  itemCount: 5),
            );
          });
  }
}

Widget cardPartenaire(
    //User c,
    /** BPC b*/
    ) {
  return Card(
    elevation: 1,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: ClipOval(
          child: Container(
            padding: null,
            height: 110,
            width: 70,
            child: Image(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/png/agc1.png")),
          ),
        ),
        title: Text(
          "TIENTCHEU ISRAEL",
          style: TextStyle(color: blue_color),
        ),
        subtitle: Text('information'),
      ),
    ),
  );
}

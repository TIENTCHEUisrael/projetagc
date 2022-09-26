import 'package:flutter/material.dart';
import 'package:projectagc/themes/constants.dart';

import 'tabs/listClient.dart';
import 'tabs/listpartenaire.dart';

class ListPages extends StatefulWidget {
  const ListPages({super.key});

  @override
  State<ListPages> createState() => _ListPagesState();
}

class _ListPagesState extends State<ListPages> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: scaffoldbackground,
        body: Column(
          children: [
            TabBar(
              indicatorColor: red_color,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(Icons.timer_off, color: Colors.black),
                      Text(
                        'Clients',
                        style: TextStyle(
                          color: blue_color,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.time_to_leave,
                        color: Colors.black,
                      ),
                      Text(
                        'Partenaires',
                        style: TextStyle(
                          color: blue_color,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListClientPage(),
                  ListPartenairePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

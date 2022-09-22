import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectagc/screens/loginPage/choicePage.dart';
import 'package:projectagc/screens/navigationPage/Page2.dart';
import 'package:projectagc/screens/navigationPage/Page1.dart';
import 'package:projectagc/themes/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../animations/buttonAnimation1.dart';

class NavigationPage extends StatefulWidget {
  static const routeNamed = "/NavigatorPage";
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 1);
              });
            },
            children: const [
              Page1(),
              Page2(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.98),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 2,
            ),
          ),
          onLastPage
              ? DelayedAnimation(
                  delay: 250,
                  child: Container(
                    alignment: const Alignment(0, 0.90),
                    child: FittedBox(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ChoicePage();
                              },
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: blue_color),
                          child: Row(
                            children: [
                              Text(
                                'Commencer',
                                style: GoogleFonts.poppins(
                                    fontSize: 20, color: Colors.white),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectagc/localisation/localization_constant.dart';

import '../../../themes/constants.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final _formKey = GlobalKey<FormState>();
  final message = TextEditingController();
  var defaultText = TextStyle(color: blue_color);
  var linkText = TextStyle(color: red_color);
  void zero() {
    setState(() {
      message.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: blue_color,
        title: Center(
          child: Text(
            getTranslated(context, 'service_title'),
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
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                height: 400,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[100]),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      getTranslated(context, 'service_message'),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: blue_color),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                        controller: message,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '   Message',
                          icon: Icon(Icons.edit),
                        ),
                        keyboardType: TextInputType.name,
                        maxLines: 5,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "S'il vous plait entrer d'abord votre message";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          final form = _formKey.currentState;
                          if (form!.validate()) {
                            form.save();
                            print('OK');
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: blue_color,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.message,
                                color: scaffoldbackground,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                getTranslated(context, 'service_button1'),
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      getTranslated(context, 'service_ou'),
                      style: TextStyle(color: blue_color, fontSize: 16),
                    ),
                    Text(
                      getTranslated(context, 'service_ou2'),
                      style: TextStyle(color: blue_color, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          print("object");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: blue_color,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.phone,
                                color: scaffoldbackground,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                getTranslated(context, 'service_button2'),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        style: defaultText,
                        text: getTranslated(context, 'service_message_end')),
                    TextSpan(
                      style: linkText,
                      text: " reclamationsclients@agc-assurances.com ",
                    ),
                    TextSpan(
                        style: defaultText,
                        text: getTranslated(context, 'service_message_end2') +
                            " +237 6 92 34 19 34"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

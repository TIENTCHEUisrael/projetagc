import 'package:flutter/material.dart';
import 'package:projectagc/themes/constants.dart';
import 'package:provider/provider.dart';

import '../animations/custum.dart';
import '../providers/providerUser.dart';

const String heroAddTodo = 'add-todo-hero';

class PopupMotdepasse extends StatefulWidget {
  PopupMotdepasse();

  @override
  State<PopupMotdepasse> createState() => _PopupMotdepasseState();
}

class _PopupMotdepasseState extends State<PopupMotdepasse> {
  @override
  Widget build(BuildContext context) {
    TextEditingController motdepasse = TextEditingController();
    bool _isloading = false;
    var _obscureText = true;
    var _iconchange = Icon(
      Icons.visibility,
      color: Colors.black,
    );
    AuthProvider auth = Provider.of<AuthProvider>(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin!, end: end!);
          },
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      height: 70,
                      width: 70,
                      child: Image.asset(
                        'assets/images/png/LOGO.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    Form(
                      child: TextFormField(
                        controller: motdepasse,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Mot de passe',
                          icon: const Icon(Icons.key),
                          suffixIcon: IconButton(
                            icon: _iconchange,
                            onPressed: () {
                              if (_obscureText == true) {
                                setState(() {
                                  _obscureText = !_obscureText;
                                  _iconchange = const Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  );
                                });
                              } else {
                                setState(() {
                                  _obscureText = !_obscureText;
                                  _iconchange = const Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  );
                                });
                              }
                            },
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "S'il vous plait entrer votre mot de passe";
                          }
                          return null;
                        },
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: blue_color),
                        child: _isloading
                            ? const CircularProgressIndicator()
                            : Text(
                                ' Changer ',
                                style: TextStyle(
                                    color: scaffoldbackground, fontSize: 18),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

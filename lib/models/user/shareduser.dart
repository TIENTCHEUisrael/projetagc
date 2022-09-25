import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  /*Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print('.......................SAVE USER.............');
    prefs.setInt("user_id", user.id!);
    prefs.setString("first_name", user.first_name);
    prefs.setString("last_name", user.last_name);
    prefs.setString("email", user.email);
    prefs.setInt("phone_number", user.phone_number);
    prefs.setString("password", user.password);
    prefs.setString("commentaire", user.commentaire);
    prefs.setString("image", user.image!);
    prefs.setString("updatedAt", user.updated_At!);

    return prefs.commit();
  }*/

  /*Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getString("user_id") as int;
    String? first_name = prefs.getString("first_name");
    String? last_name = prefs.getString("last_name");
    String? email = prefs.getString("email");
    int? phone_number = prefs.getString("phone_number") as int;
    String? password = prefs.getString("passwordd");
    String? commentaire = prefs.getString("commentaire");
    String? image = prefs.getString("image");
    String? updatedAt = prefs.getString("updatedAt");

    return User(
      identifiant: json['Identifiant'] as String,
      prenom: json['Prenom'] as String,
      nom: json['Nom'] as String,
      sexe: json['Sexe'] as String,
      societe: json['Nom_Societe'] as String,
      motdepasse: json['Password'] as String,
      email: json['Email'] as String,
      photo: json['Photo'] as String,
      telephone: json['Telephone'] as String,
      ville: json['Ville'] as String,
      createdAt: json['CreatedAt'] as String,
    );
  }*/

  /*void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("user_id");
    prefs.remove("first_name");
    prefs.remove("last_name");
    prefs.remove("email");
    prefs.remove("phone_number");
    prefs.remove("password");
    prefs.remove("commentaire");
    prefs.remove("image");
    prefs.remove("updatedAt");
    prefs.remove("updatedAt");
    prefs.remove("updatedAt");
  }*/

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString("token")!;
    print('read :$value');
    return value;
  }

  Future<bool> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("token", token);
    return true;
  }

  static saveUserToSharePreference(Map<String, dynamic> data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('currentUser', jsonEncode(data));
    print('.........................LOGING...................');
    return prefs.commit();
  }

  static removeUserToSharePreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("currentUser");
    print('..............REMOVE.............');
  }
}

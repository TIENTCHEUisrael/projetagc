import 'package:projectagc/models/BonDePriseEnCharge/institution.dart';

class Town {
  final String name;
  final List<Institutions> institutions;

  Town({required this.name, required this.institutions});

  factory Town.fromJson(dynamic json) {
    return Town(
        name: json['town'] as String,
        institutions: json['partners'] as List<Institutions>);
  }
  static List<Town> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) => Town.fromJson(data)).toList();
  }

  @override
  String toString() {
    return 'Town {name:$name,institutions:$institutions}';
  }
}

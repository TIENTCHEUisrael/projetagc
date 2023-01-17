class Locales {
  final int? id;
  final String nom;
  Locales({this.id, required this.nom});

  factory Locales.fromJson(dynamic json) {
    return Locales(
      id: json['id'] as int,
      nom: json['nom'] as String,
    );
  }
  static List<Locales> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) => Locales.fromJson(data)).toList();
  }

  @override
  String toString() {
    return 'Locales {id:$id,nom:$nom}';
  }
}

class Institutions {
  final String? id;
  final String name;
  final String institutionId;
  final String ville;
  final String description;

  Institutions(
      {this.id,
      required this.name,
      required this.institutionId,
      required this.ville,
      required this.description});

  factory Institutions.fromJson(dynamic json) {
    return Institutions(
        id: json['id'] as String,
        name: json['name'] as String,
        institutionId: json['institution'] as String,
        ville: json['town'] as String,
        description: json['description'] as String);
  }
  static List<Institutions> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) => Institutions.fromJson(data)).toList();
  }

  @override
  String toString() {
    return 'Institutions {id:$id,name:$name,institution!$institutionId,ville:$ville,description:$description}';
  }
}

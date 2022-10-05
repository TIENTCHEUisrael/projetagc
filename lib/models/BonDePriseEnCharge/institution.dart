class Institutions {
  final int? id;
  final String name;
  final int institutionId;
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
        id: json['id'] as int,
        name: json['name'] as String,
        institutionId: json['institution'] as int,
        ville: json['ville'] as String,
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

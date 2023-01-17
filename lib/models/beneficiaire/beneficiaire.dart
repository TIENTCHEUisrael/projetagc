class Beneficiaire {
  final int? idBeneficiaire;
  final String nom;
  final String prenom;
  final String client;
  final String datenaissance;
  final String sexe;
  final String? createdAt;
  final String? updatedAt;

  Beneficiaire({
    this.idBeneficiaire,
    required this.nom,
    required this.prenom,
    required this.client,
    required this.datenaissance,
    required this.sexe,
    this.createdAt,
    this.updatedAt,
  });

  factory Beneficiaire.fromJson(dynamic json) {
    return Beneficiaire(
        idBeneficiaire: json['id'] as int,
        nom: json['firstname'] as String,
        prenom: json['lastname'] as String,
        client: json['customer'] as String,
        datenaissance: json['birth_day'] as String,
        createdAt: json['CreatedAt'] as String,
        sexe: json['gender'] as String);
  }

  static List<Beneficiaire> beneficiairesFromSnapshots(List snapshot) {
    return snapshot.map((data) => Beneficiaire.fromJson(data)).toList();
  }

  static Beneficiaire beneficiairesFromSnapshot(Beneficiaire snapshot) {
    return snapshot;
  }

  @override
  String toString() {
    return 'Beneficiaire{id:$idBeneficiaire,firstname:$nom,lastname:$prenom,customer:$client,birth_day:$datenaissance,CreatedAt:$createdAt,gender:$sexe}';
  }
}

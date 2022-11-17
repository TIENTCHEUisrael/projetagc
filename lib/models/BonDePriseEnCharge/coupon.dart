class Coupon {
  final int? id;
  final String ville;
  final String partenaire;
  final String identifiantclient;
  final String? beneficial;

  Coupon(
      {this.id,
      required this.ville,
      required this.partenaire,
      required this.identifiantclient,
      this.beneficial});

  factory Coupon.fromJson(dynamic json) {
    return Coupon(
      ville: json['ville'] as String,
      partenaire: json['partenaire'] as String,
      identifiantclient: json['identifiant'] as String,
      beneficial: json['beneficial'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
        "ville": ville,
        "partenaire": partenaire,
        "identifiant": identifiantclient,
        "beneficial": beneficial
      };

  static List<Coupon> usersFromSnapshot(List snapshot) {
    return snapshot.map((data) => Coupon.fromJson(data)).toList();
  }

  static Coupon userFromSnapshot(Coupon snapshot) {
    return snapshot;
  }
}

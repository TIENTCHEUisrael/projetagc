import '../user/user.dart';

class Coupon {
  final int? id;
  final String ville;
  final int partenaire;
  final String identifiantclient;

  Coupon(
      {this.id,
      required this.ville,
      required this.partenaire,
      required this.identifiantclient});

  factory Coupon.fromJson(dynamic json) {
    return Coupon(
        ville: json['ville'],
        partenaire: json['partenaire'],
        identifiantclient: json['identifiant']);
  }
  Map<String, dynamic> toJson() => {
        "ville": ville,
        "partenaire": partenaire,
        "identifiant": identifiantclient,
      };

  static List<Coupon> usersFromSnapshot(List snapshot) {
    return snapshot.map((data) => Coupon.fromJson(data)).toList();
  }

  static Coupon userFromSnapshot(Coupon snapshot) {
    return snapshot;
  }
}

class StatutC {
  final String idStatut;
  final String nom;
  final String prenom;
  final String telephone;
  final String category;
  final String identifiantCustumer;
  final String sickness;
  final String createdAt;
  final String status;
  final String doctor;
  final String prescription;
  final String coupon;
  final String amount;
  final String type;
  String? discount;
  final String namePartenaire;
  final String villePartenaire;
  final String descriptionPartenaire;

  StatutC({
    required this.idStatut,
    required this.nom,
    required this.prenom,
    required this.telephone,
    required this.category,
    required this.identifiantCustumer,
    required this.sickness,
    required this.status,
    required this.doctor,
    required this.prescription,
    required this.coupon,
    required this.amount,
    required this.type,
    required this.createdAt,
    required this.namePartenaire,
    required this.villePartenaire,
    required this.descriptionPartenaire,
    this.discount,
  });

  factory StatutC.fromJson(dynamic json) {
    return StatutC(
        idStatut: json['id'],
        nom: json['firstname'],
        prenom: json['lastname'],
        telephone: json['telephone'],
        category: json['category'],
        identifiantCustumer: json['customer'],
        sickness: json['sickness'],
        status: json['status'],
        doctor: json['doctor'],
        prescription: json['prescription'],
        coupon: json['coupon'],
        amount: json['amount'],
        type: json['type'],
        createdAt: json['CreatedAt'],
        namePartenaire: json['name'],
        villePartenaire: json['town'],
        descriptionPartenaire: json['description']);
  }

  static List<StatutC> statutCFromSnapshots(List snapshot) {
    return snapshot.map((data) => StatutC.fromJson(data)).toList();
  }

  static StatutC statutCFromSnapshot(StatutC snapshot) {
    return snapshot;
  }

  @override
  String toString() {
    return 'StatutC{id:$idStatut,firstname:$nom,lastname:$prenom,telephone:$telephone,category:$category,customer:$identifiantCustumer,sickness:$sickness,status:$status,doctor:$doctor,prescription:$prescription,coupon:$coupon,amount:$amount,type:$type,createdAt:$createdAt,namePartenaire:$namePartenaire,villePartenaire:$villePartenaire,}';
  }
}

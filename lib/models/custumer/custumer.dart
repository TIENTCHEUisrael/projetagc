class Custumer {
  final List<dynamic> clients;
  final List<dynamic> affiliate;
  final int affiliateCount;
  final String? createdAt;

  Custumer(
      {required this.clients,
      required this.affiliate,
      required this.affiliateCount,
      this.createdAt});

  factory Custumer.fromJson(dynamic json) {
    return Custumer(
        clients: json['customer'] as List,
        affiliate: json['affiliates'] as List,
        affiliateCount: json['affiliateCount'] as int);
  }
  Map<String, dynamic> toJson() => {
        "customer": clients,
        "affiliates": affiliate,
        "affiliateCount": affiliateCount
      };

  static List<Custumer> usersFromSnapshot(List snapshot) {
    return snapshot.map((data) => Custumer.fromJson(data)).toList();
  }

  static Custumer userFromSnapshot(Custumer snapshot) {
    return snapshot;
  }

  @override
  String toString() {
    return 'customer:$clients,affiliates:$affiliate,affiliateCount$affiliateCount';
  }
}

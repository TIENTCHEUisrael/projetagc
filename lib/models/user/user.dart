class User {
  final String? idUser;
  final String identifiant;
  final String prenom;
  final String nom;
  final String sexe;
  final String societe;
  final String motdepasse;
  final String email;
  final String photo;
  final String telephone;
  final String ville;
  final String remise;
  final String rang;
  final String maximum;
  final String used;
  final String beneficial;
  final String expireDate;
  final String dateNaissance;
  final String createdAt;
  final String beginDate;
  final String? updatedAt;

  User({
    this.idUser,
    required this.identifiant,
    required this.prenom,
    required this.nom,
    required this.sexe,
    required this.societe,
    required this.motdepasse,
    required this.email,
    required this.photo,
    required this.telephone,
    required this.ville,
    required this.remise,
    required this.rang,
    required this.maximum,
    required this.used,
    required this.beneficial,
    required this.expireDate,
    required this.dateNaissance,
    required this.beginDate,
    required this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(dynamic json) {
    return User(
      idUser: json['Id'] as String,
      identifiant: json['Identifiant'] as String,
      prenom: json['firstname'] as String,
      nom: json['lastname'] as String,
      sexe: json['gender'] as String,
      societe: json['enterprise'] as String,
      motdepasse: json['Password'] as String,
      email: json['Email'] as String,
      photo: json['Photo'] as String,
      telephone: json['Telephone'] as String,
      ville: json['town'] as String,
      remise: json['discount'] as String,
      rang: json['rank'] as String,
      maximum: json['maximum'] as String,
      beneficial: json['beneficial'] as String,
      used: json['used'] as String,
      expireDate: json['expiry_date'] as String,
      dateNaissance: json['birth_day'] as String,
      createdAt: json['CreatedAt'] as String,
      beginDate: json['begin_date'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
        "Id": idUser,
        "firstname": prenom,
        "lastname": nom,
        "gender": sexe,
        "enterprise": societe,
        "Password": motdepasse,
        "Email": email,
        "Photo": photo,
        "Telephone": telephone,
        "town": ville,
        "CreatedAt": createdAt,
        "Identifiant": identifiant,
        "discount": remise,
        "rank": rang,
        "beneficial": beneficial,
        "maximum": maximum,
        "used": used,
        "expiry_date": expireDate,
        "birth_day": dateNaissance,
        "begin_date": createdAt,
      };

  static List<User> usersFromSnapshots(List snapshot) {
    return snapshot.map((data) => User.fromJson(data)).toList();
  }

  static User userFromSnapshot(User snapshot) {
    return snapshot;
  }

  @override
  String toString() {
    return 'User {Id:$idUser,Identifiant: $identifiant,Prenom: $prenom,Nom: $nom,Sexe: $sexe,Nom_Societe: $societe,mot_de_passe:$motdepasse,Email: $email,Photo: $photo,Telephone: $telephone,Ville: $ville,Remise:$remise,Rang:$rang,maximum:$maximum,Beneficial:$beneficial,CreatedAt: $createdAt,deginDate:$beginDate,used :$used,expiry_date:$expireDate,birth_day:$dateNaissance}';
  }
}

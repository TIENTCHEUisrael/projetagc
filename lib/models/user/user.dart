class User {
  //final int? idUser;
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
  final String? createdAt;
  final String? updatedAt;

  User({
    //this.idUser,
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
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(dynamic json) {
    return User(
      //idUser: json['Id'] as int,
      identifiant: json['Identifiant'] as String,
      prenom: json['Prenom'] as String,
      nom: json['Nom'] as String,
      sexe: json['Sexe'] as String,
      societe: json['Nom_Societe'] as String,
      motdepasse: json['Password'] as String,
      email: json['Email'] as String,
      photo: json['Photo'] as String,
      telephone: json['Telephone'] as String,
      ville: json['Ville'] as String,
      createdAt: json['CreatedAt'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        //"Id": idUser,
        "Identifiant": identifiant,
        "Prenom": prenom,
        "Nom": nom,
        "Sexe": sexe,
        "Nom_Societe": societe,
        "Email": email,
        "Photo": photo,
        "Telephone": telephone,
        "Ville": ville,
        "CreatedAt": createdAt,
      };

  static List<User> usersFromSnapshot(List snapshot) {
    return snapshot.map((data) => User.fromJson(data)).toList();
  }

  static User userFromSnapshot(User snapshot) {
    return snapshot;
  }

//Id: $idUser,
  @override
  String toString() {
    return 'User {Identifiant: $identifiant,Prenom: $prenom,Nom: $nom,Sexe: $sexe,Nom_Societe: $societe,Email: $email,Photo: $photo,Telephone: $telephone,Ville: $ville,CreatedAt: $createdAt}';
  }
}

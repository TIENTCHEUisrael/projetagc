class Services {
  //http://agcassurance.42web.io/api/customers/auth.php?Identifiant=test&Password=test
  //http://agcassurance.42web.io/api/coupon/newcoupon.php?ville=Douala&partenaire=1&client=202120TTAD092067
  //http://agcassurance.42web.io/api/client/update.php?Prenom=israel&Nom=braselin&Sexe=Masculin&Nom_Societe=untest&Password=test&Email=test&Photo=test&Telephone=test&Ville=test&Identifiant=test
  static String urlclient = "http://agcassurance.42web.io/api/customers";
  static String urllist =
      "http://agcassurance.42web.io/api/institution/read.php?";
  static String urlcoupon = "http://agcassurance.42web.io/api/coupon";
  static String urlinstitut = "http://agcassurance.42web.io/api/partners";
  static String urlgetallinstitut =
      "http://agcassurance.42web.io/api/partners/read.php";
  static String urlupdate =
      "http://agcassurance.42web.io/api/client/update.php?";
  static String urlsendEmail = "https://api.emailjs.com/api/v1.0/email/send";
}

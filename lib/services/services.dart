class Services {
  //http://agcassurance.42web.io/api/customers/auth.php?Identifiant=test&Password=test
  //http://agcassurance.42web.io/api/coupon/newcoupon.php?ville=Douala&partenaire=1&client=202120TTAD092067
  //http://agcassurance.42web.io/api/client/update.php?Prenom=israel&Nom=braselin&Sexe=Masculin&Nom_Societe=untest&Password=test&Email=test&Photo=test&Telephone=test&Ville=test&Identifiant=test
  //http://agcassurance.42web.io/api/cities/readall.php
  //http://agcassurance.42web.io/api/cities/readall.php?i=4
  //http://agcassurance.42web.io/api/partners/get.php?Institution=1&Town=Douala
  //http://agcassurance.42web.io/api/customers/setPassword.php?Identifiant=test&Password=test34


  //http://agcassurance.42web.io/api/customers/auth2.php?Identifiant=test&Password=test34&i=2
  static String urlclient = "http://agcassurance.42web.io/api/customers/auth2.php?";
  static String urllist =
      "http://agcassurance.42web.io/api/institution/read.php?";
  static String urlcoupon = "http://agcassurance.42web.io/api/coupon";
  static String urlinstitut = "http://agcassurance.42web.io/api/partners";
  static String urlgetallinstitut =
      "http://agcassurance.42web.io/api/partners/read.php";
  static String urlupdate =
      "http://agcassurance.42web.io/api/customers/setPassword.php?";
  static String urlvillepartenaire =
      "http://agcassurance.42web.io/api/cities/readall.php?i=1";
  static String urlpartners =
      "http://agcassurance.42web.io/api/partners/get.php?Institution=1&";
}

class Services {
  //https://agcassurance.site/api/customers/auth.php?Identifiant=test&Password=test
  //https://agcassurance.site/api/client/update.php?Prenom=israel&Nom=braselin&Sexe=Masculin&Nom_Societe=untest&Password=test&Email=test&Photo=test&Telephone=test&Ville=test&Identifiant=test
  //https://agcassurance.site/api/cities/readall.php
  //https://agcassurance.site/api/cities/readall.php?i=4
  //https://agcassurance.site/api/partners/get.php?Institution=1&Town=Douala
  //https://agcassurance.site/api/customers/setPassword.php?Identifiant=test&Password=test34
  //https://agcassurance.site/api/coupon/newcoupon.php?ville=Douala&partenaire=1&client=202120TTAD092067&statut=1&i=3&beneficial=4
  //https://agcassurance.site/api/bpc/read.php?Identifiant=2212131KaFo01890&i=1
  //https://agcassurance.site/api/customers/auth2.php?Identifiant=test&Password=test34&i=2
  //https://agcassurance.site/api/customers/auth2.php?Identifiant=test&Password=test
  static String urlclient =
      "https://agcassurance.site/api/customers/auth2.php?";
  static String urllist = "https://agcassurance.site/api/institution/read.php?";
  static String urlcoupon =
      "https://agcassurance.site/api/coupon/newcoupon.php?";
  static String urlinstitut = "https://agcassurance.site/api/partners";
  static String urlgetallinstitut =
      "https://agcassurance.site/api/partners/read.php";
  static String urlupdate =
      "https://agcassurance.site/api/customers/setPassword.php?";
  static String urlvillepartenaire =
      "https://agcassurance.site/api/cities/readall.php?i=1";
  static String urlpartners =
      "https://agcassurance.site/api/partners/get.php?Institution=1&";
  static String urlstatut = "https://agcassurance.site/api/bpc/read.php?";
}

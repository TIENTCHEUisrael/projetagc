class Services {
  //https://agc.levegi.com/api/customers/auth.php?Identifiant=test&Password=test
  //https://agc.levegi.com/api/client/update.php?Prenom=israel&Nom=braselin&Sexe=Masculin&Nom_Societe=untest&Password=test&Email=test&Photo=test&Telephone=test&Ville=test&Identifiant=test
  //https://agc.levegi.com/api/cities/readall.php
  //https://agc.levegi.com/api/cities/readall.php?i=4
  //https://agc.levegi.com/api/partners/get.php?Institution=1&Town=Douala
  //https://agc.levegi.com/api/customers/setPassword.php?Identifiant=test&Password=test34
  //https://agc.levegi.com/api/coupon/newcoupon.php?ville=Douala&partenaire=1&client=202120TTAD092067&statut=1&i=3&beneficial=4
  //https://agc.levegi.com/api/bpc/read.php?Identifiant=2212131KaFo01890&i=1
  //https://agc.levegi.com/api/customers/auth2.php?Identifiant=test&Password=test34&i=2
  //https://agc.levegi.com/api/customers/auth2.php?Identifiant=test&Password=test
  static String urlclient = "https://agc.levegi.com/api/customers/auth2.php?";
  static String urllist = "https://agc.levegi.com/api/institution/read.php?";
  static String urlcoupon = "https://agcassurance.site/api/coupon/newcoupon.php?";
  static String urlinstitut = "https://agc.levegi.com/api/partners";
  static String urlgetallinstitut =
      "https://agc.levegi.com/api/partners/read.php";
  static String urlupdate =
      "https://agc.levegi.com/api/customers/setPassword.php?";
  static String urlvillepartenaire =
      "https://agc.levegi.com/api/cities/readall.php?i=1";
  static String urlpartners =
      "https://agc.levegi.com/api/partners/get.php?Institution=1&";
  static String urlstatut = "https://agc.levegi.com/api/bpc/read.php?";
  static String urlpdf = "https://agc.levegi.com/pdfs/generated";
}

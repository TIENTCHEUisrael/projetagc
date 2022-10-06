class Services {
  //http://agcassurance.42web.io/api/customers/auth.php?Identifiant=test&Password=test
  //http://agcassurance.42web.io/api/coupon/newcoupon.php?ville=Douala&partenaire=1&client=202120TTAD092067
  static String urlclient = "http://agcassurance.42web.io/api/customers";
  static String urllist =
      "http://agcassurance.42web.io/api/institution/read.php?";
  static String urlcoupon = "http://agcassurance.42web.io/api/coupon";
  static String urlinstitut = "http://agcassurance.42web.io/api/partners";
  static String urlgetallinstitut =
      "http://agcassurance.42web.io/api/partners/read.php";
  static String urlsendEmail = "https://api.emailjs.com/api/v1.0/email/send";
}

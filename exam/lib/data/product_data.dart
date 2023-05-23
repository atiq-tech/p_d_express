class Productdata {
  String img;
  String company;
  String title;
  String price;
  bool isClick;
  Productdata(this.img, this.company, this.title, this.price, this.isClick);
  static List<Productdata> generatedMySourecList() {
    return [
      Productdata("images/hp1.png", "AKG N700NCM2 Wireless", "HeadPhones",
          "\$55US", true),
      Productdata("images/hp2.png", "Awv Wired Headphones", "HeadPhones",
          "\$15US", false),
      Productdata(
          "images/hp3.jpg", "Vivo 9pro Max", "HeadPhones", "\$75US", true),
      Productdata(
          "images/hp4.jpg", "iPhone Pro Max", "iPhone", "\$505US", true),
      Productdata("images/hpw1.jpg", "AKG N700NCM2 Wire", "HPhone Vivo",
          "\$55US", false),
      Productdata(
          "images/hpw2.jpg", "VIVO Y12 Wire", "Cotton HPhone", "\$34US", true),
      Productdata(
          "images/hpw3.jpg", "REDMY 9PRO MAX", "RNP HPhone", "\$17US", false),
      Productdata("images/hp1.png", "AKG N700NCM2 Wireless", "HeadPhones",
          "\$55US", true),
    ];
  }
}

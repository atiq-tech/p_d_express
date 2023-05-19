class Traveldata {
  String img;
  String company;
  String title;
  String price;
  bool isClick;
  Traveldata(this.img, this.company, this.title, this.price, this.isClick);
  static List<Traveldata> generatedMySourecList() {
    return [
      Traveldata("images/img1.jpg", "Thayland", "Historic", "\$55US", true),
      Traveldata("images/img2.jpg", "Canada", "Mountent", "\$15US", false),
      Traveldata("images/img3.jpg", "Maldip", "Clorical", "\$75US", true),
      Traveldata("images/img4.jpg", "America", "Beauty", "\$505US", true),
      Traveldata("images/img5.jpg", "Swizerland", "Aamron", "\$55US", false),
      Traveldata("images/img6.jpg", "Newzeland", "Roadistic", "\$34US", true),
      Traveldata("images/img7.jpg", "South Africa", "Amazon", "\$17US", false),
      Traveldata("images/img8.jpg", "Wels", "Zebrana", "\$10US", true),
      Traveldata("images/trav.jpg", "Pakistan", "Aarong", "\$55US", true),
    ];
  }
}

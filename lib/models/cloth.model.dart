class ClothModel {
  int? id;
  String? title;
  String? imgurl;
  String? desc;
  String? price;

  String? link;
  double? rating;

  ClothModel({
    this.desc,
    this.id,
    this.title,
    this.link,
    this.imgurl,
    this.price,
  });
  ClothModel.fromData(Map<String, dynamic> json) {
    // if (json['comments'] != null) {
    //   title = json['title'];
    //   desc = json['content'];
    //   imgurl = json['image'];
    // } else {
    title = json['title'];
    desc = json['content'];
    imgurl = json['image'];
    link = json['link'];
    price = json['price'];
    // }
  }
}

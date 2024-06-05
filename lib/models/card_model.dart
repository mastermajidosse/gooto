class CardModule {
  final int id;
  final int price;
  final String place;
  final int isLiked;
  final String desc;
  final String img;
  const CardModule({
    required this.id,
    required this.price,
    required this.place,
    required this.isLiked,
    required this.desc,
    required this.img,
  });
  CardModule copyWith({required int isLiked}) {
    return CardModule(
      id: this.id,
      price: this.price,
      place: this.place,
      isLiked: isLiked,
      desc: this.desc,
      img: this.img,
    );
  }

  Map<String, dynamic> toJson() => {
        'place': place,
        'price': price,
        'isLiked': isLiked,
        'desc': desc,
        'img': img,
      };
  factory CardModule.fromJson(Map<String, dynamic> json) => CardModule(
        id: json['id'],
        place: json['place'],
        price: json['price'],
        isLiked: json['isLiked'],
        desc: json['desc'],
        img: json['img'],
      );
}

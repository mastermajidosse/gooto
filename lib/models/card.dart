class CardModule {
  final int id;
  final int price;
  final String place;
  final bool isLiked;
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

  CardModule copyWith(bool newPrice) {
    return CardModule(
      id: this.id,
      price: this.price,
      place: this.place,
      isLiked: newPrice,
      desc: this.desc,
      img: this.img,
    );
  }
}

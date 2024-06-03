class SaveModel {
  int? id;
  String? uid;
  String? title;
  String? imgurl;

  SaveModel({
    this.uid,
    this.id,
    this.title,
    this.imgurl,
  });
  static SaveModel fromData(map) {
    return SaveModel(
      id: map['id'],
      uid: map['uid'].toString(),
      title: map['title'].toString(),
      imgurl: map['imgurl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'uid': uid,
      "title": title,
      "imgurl": imgurl,
    };
  }
}

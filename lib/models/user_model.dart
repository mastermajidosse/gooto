import 'dart:convert';

class UserModel {
  String? uid;
  String? firstname;
  String? password;
  String? email;
  String? imgurl;
  String? country;
  DateTime? creationDate = DateTime.now();
  String? instagram = "";
  bool? isAdmin = false;

  UserModel({
    this.uid,
    this.email,
    this.firstname,
    this.password,
    this.imgurl = "",
    this.country,
    this.isAdmin = false,
    this.creationDate,
    this.instagram = "",
  });
  static const Map<String, dynamic> fakelistStreak = {};
  // Map<String, dynamic>? map
  static UserModel fromData(map) {
    print("${map!['name']},$map['imgurl'],$map['country']");
    if (map == null) return UserModel();
    return UserModel(
      uid: map['uid'].toString(),
      firstname: map['name'].toString(),
      email: map['email'].toString(),
      country: map['country'].toString(),
      imgurl: map['image'].toString(),
    );
  }

  UserModel.fromJson(map) {
    firstname = map['name'].toString();
    email = map['email'].toString();
    isAdmin = map['isAdmin'] ?? false;
    country = map['country'].toString();
    imgurl = map['image'].toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      "firstname": firstname,
      "email": email,
      "imgurl": imgurl,
      "country": country,
      "creationDate": DateTime.now(),
      "instagram": instagram,
    };
  }

  toJsononly2() {
    return jsonEncode({
      "name": firstname,
      "country": country,
      "imgurl": "https://i0.wp.com/rouelibrenmaine.fr/wp-content/uploads/2018/10/empty-avatar.png",
    });
  }

  logintoJson() {
    return jsonEncode({
      "email": email,
      "password": password,
    });
  }

  registertoJson() {
    return jsonEncode({
      "name": firstname,
      "email": email,
      "password": password,
    });
  }
}

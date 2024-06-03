// import 'package:html/parser.dart';

class PostModel {
  String? titlear;
  String? titleen;
  String? descen;
  String? descar;
  bool? lang;
  String? link;
  String? status;
  List? images;
  // List? likes;
  // List? updates;
  // List? reports;
  // List? comments;
  String? categoryar;
  String? categoryen;
  String? categorcolor;
  String? userid;
  String? creationDate;

  // List? likes;

  PostModel({
    this.titleen,
    this.titlear,
    this.descen,
    this.descar,
    this.creationDate,
    this.lang,
    this.link,
    this.status,
    this.images,
    // this.likes,
    // this.updates,
    // this.reports,
    // this.comments,
    this.categoryar,
    this.categoryen,
    this.categorcolor,
    this.userid,
  });
  static PostModel fromData(Map<String, dynamic> map) {
    // if (map == null) return PostModel();
    // print(" title :L " + map['title']['en']);
    return PostModel(
      titlear: map['title']['ar'],
      titleen: map['title']['en'],
      descen: map['desc']['en'],
      descar: map['desc']['ar'],
      lang: map['lang'],
      link: map['link'].toString(),
      creationDate: map['createdAt'],
      images: map['images'],
      status: map['status'],
      userid: map['user'],
      // categoryen: map['category']["name"]['en'],
      // categorcolor: map['category']['color'],
      // categoryar: map['category'],
    );
  }

  // String parseHtmlString(String htmlString) {
  //   final document = parse(htmlString);
  //   final String parsedString =
  //       parse(document.body!.text).documentElement!.text;

  //   return parsedString;
  // }

  Map<String, dynamic> toJson() {
    return {
      'titlear': titlear,
      "titleen": titleen,
      "descen": descen,
      "descar": descar,
      "link": link,
      "createdAt": DateTime.now(),
      "images": images,
      "status": status,
      "lang": lang,
      "userid": userid,
    };
  }
}

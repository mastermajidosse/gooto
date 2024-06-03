import 'dart:convert';

class BlogModel {
  int? id;
  String? title;
  String? imgurl;
  String? desc;
  List<Comments>? comments;
  // String? desc;

  BlogModel({
    this.desc,
    this.id,
    this.title,
    this.imgurl,
    this.comments,
  });
  BlogModel.fromData(Map<String, dynamic> json) {
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromData(v));
      });
      title = json['title'];
      desc = json['content'];
      imgurl = json['image'];
    } else {
      title = json['title'];
      desc = json['content'];
      imgurl = json['image'];
      comments = <Comments>[];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'content': desc,
      "title": title,
      "image": imgurl,
    };
  }

  toJsonarticleall() {
    return jsonEncode({
      "title": title.toString(),
      "image": imgurl.toString(),
      "content": desc.toString(),
      "status": false,
    });
  }

  toJsonVideo() {
    return jsonEncode({
      'content': desc,
      "title": title,
      "image":
          "https://colourlex.com/wp-content/uploads/2021/02/vine-black-painted-swatch-300x300.jpg",
    });
  }
}

class Comments {
  String? name;
  String? comment;
  // String? desc;

  Comments({
    this.name,
    this.comment,
  });

  static Comments fromData(map) {
    print('map');

    print(map);

    return Comments(
      // name: map['author']['name'],
      comment: map['comment'].toString(),
    );
  }
}

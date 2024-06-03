class AudioModel {
  int? id;
  String? name;
  String? logo;
  String? desc;
  String? photos;
  String? flagname;

  AudioModel({
    this.desc,
    this.id,
    this.name,
    this.logo,
    this.flagname,
    this.photos,
  });
  static AudioModel fromData(map) {
    print(map['tags'].toString());
    return AudioModel(
      id: map['id'],
      desc: map['description'].toString(),
      name: map['name'].toString(),
      flagname: map['country']['flagname'].toString(),
      logo: map['images'][0].toString(),
      photos: map['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'desc': desc,
      "name": name,
      "image": logo,
    };
  }
}

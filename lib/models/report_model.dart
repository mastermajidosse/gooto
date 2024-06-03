class ReportModel {
  String? uid;
  String? from;
  String? message;
  DateTime? creationDate = DateTime.now();

  ReportModel({
    this.uid,
    this.from,
    this.message,
    this.creationDate,
  });

  static ReportModel fromData(Map<String, dynamic>? map) {
    if (map == null) return ReportModel();
    return ReportModel(
      uid: map['uid'].toString(),
      from: map['from'].toString(),
      message: map['message'].toString(),
      creationDate: map['creationDate'].toDate() as DateTime,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      "from": from,
      "message": message,
      "creationDate": DateTime.now(),
    };
  }
}

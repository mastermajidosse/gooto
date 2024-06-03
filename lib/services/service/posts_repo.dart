import 'package:intl/intl.dart';
import 'package:gooto/models/blog_model.dart';
import 'package:gooto/models/video_model.dart';
import 'package:gooto/services/api/post_api.dart';

class PostsRepo {
  BlogModel post = BlogModel();
  List<BlogModel> allposts = [];
  List<BlogModel> tacticposts = [];
  final week = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 8);

  String timenow = DateFormat('dd-MM-yyyy').format(DateTime.now());

  DateTime now = DateTime.now();
  DateTime yesterday = DateTime.now().subtract(Duration(days: 1));

  addVideo(BlogModel vide) async {
    await PostApi().postVideo(vide);
  }

  addArticle(BlogModel vide) async {
    await PostApi().postarticle(vide);
  }

  List<VideoModel> allvideos = [];

  getVideos() async {
    allvideos = [];
    var result = await PostApi().getVideosAPi();
    AllVideosModel.fromJson(result);
    result['videos'].forEach((myposts) => allvideos.add(VideoModel.fromData(myposts)));

    return allvideos;
  }

  List<BlogModel> postarticle = [];

  getarticle() async {
    postarticle = [];
    var result = await PostApi().getarticles();
    result['articles'].forEach((myposts) => postarticle.add(BlogModel.fromData(myposts)));

    return postarticle;
  }
}

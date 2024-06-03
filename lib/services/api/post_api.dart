import 'package:gooto/models/blog_model.dart';
import 'package:gooto/models/user_model.dart';
import 'package:gooto/services/api/api.dart';

class PostApi {
  Api api = Api();

  static final PostApi _authApi = PostApi._internal();

  factory PostApi() {
    return _authApi;
  }

  PostApi._internal();

  // Future<dynamic> getPosts() async {
  //   return await api.httpGet("blog");
  // }

  Future<dynamic> getPostsByCat(String cat) async {
    return await api.httpGet("blog", query: {"category": cat});
  }

  Future<dynamic> getteam() async {
    return await api.httpGet("v1/team");
  }

  Future<dynamic> getAllPosts() async {
    return await api.httpGet("blog/lastnews"); // http://localhost:5000/api/v1/articles
  }

  Future<dynamic> getarticles() async {
    return await api.httpGet("v1/articles"); // http://localhost:5000/api/
  }

  Future<dynamic> getTrolls() async {
    return await api.httpGet("troll");
  }

  Future<dynamic> getVideosAPi() async {
    return await api.httpGet("v1/videos");
  }

  Future<dynamic> register(UserModel user) async {
    return await api.httpPost("v1/users/register", user.registertoJson());
  }

  // Future<dynamic> getPostStatus(String status) async {
  //   return await api.httpGet();
  // }

  // Future<dynamic> logout() async {
  //   return await api.httpPost(jsonEncode({}));
  // }
  Future<dynamic> postVideo(BlogModel video) async {
    return await api.httpPostar("youtube", video.toJsonVideo());
  }

  Future<dynamic> postarticle(BlogModel articleall) async {
    return await api.httpPostar("blog", articleall.toJsonarticleall());
  }

  // Future<dynamic> recoverPassword(String email) async {
  //   print("{'email': email}");
  //   print({'email': email});
  //   return await api.httpPost(jsonEncode({'email': email}));
  // }
}

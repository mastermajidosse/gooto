import 'package:gooto/models/post_model.dart';
import 'package:gooto/services/api/post_api.dart';

class PostService {
  static final PostService _echoService = PostService._internal();

  factory PostService() {
    return _echoService;
  }

  PostService._internal();
  PostApi _postApi = PostApi();

  List<PostModel> posts = [];

  bool nextPage = true;

  Future<List<PostModel>> getPosts(int page) async {
    if (page == 1) posts.clear();

    // var result = await _postApi.getPostsApproved();
    var result = await _postApi.getteam();
    await result['data'].forEach((post) => posts.add(PostModel.fromData(post)));
    nextPage = result['links']['next'] != null ? true : false;

    return posts;
  }

  // Future<CommentModel> storeComment(CommentModel comment) async {
  //   await _postApi.storeComment(comment);

  //   return comment;
  // }

  // Future<PostModel> storePost(PostModel post, File file, POSTTYPE type) async {
  //   var result = await _postApi.storePost(post: post, file: file, type: type);
  //   print(result);
  //   return PostModel.fromJson(result['data']);
  // }

  // Future<void> deletePost(int id) async {
  //   await _postApi.deletePost(id);
  // }
}

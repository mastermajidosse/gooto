import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:gooto/models/blog_model.dart';
import 'package:gooto/services/helpers/exceptions/FetchDataException.dart';
import 'package:gooto/services/service/posts_repo.dart';

part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  FeedCubit() : super(FeedState());

  BlogModel postModel = BlogModel();
  PostsRepo postsRepo = PostsRepo();
  Future topPosts() async {
    emit(FeedState(loading: true));
    try {
      var posts;
      // emit(FeedState(posts: posts));
    } on SocketException {
      emit(FeedState(errorMessage: "No connection or server is not responding"));
      throw FetchDataException('No Internet connection');
    } catch (e) {
      debugPrint("----- error topPosts --- " + e.toString());
      emit(FeedState(errorMessage: "Couldn't Load the team requests"));
    }
  }
}

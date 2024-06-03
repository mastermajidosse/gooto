import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:gooto/models/blog_model.dart';
import 'package:gooto/models/post_model.dart';
import 'package:gooto/screen/bottom_tab.dart';
import 'package:gooto/services/service/posts_repo.dart';
import 'package:gooto/utils/mystyle.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddInitial());

  PostsRepo postsRepo = PostsRepo();

  Future submitPost(BuildContext context, sc, BlogModel myvid) async {
    emit(AddarticleLoading());
    print("------submit post----");

    try {
      await postsRepo.addVideo(myvid);

      emit(Addarticledone());
      Navigator.pushNamed(context, BottomTabBarr.routeName);
    } catch (e) {
      Mystyle.err(sc, e.toString());
      emit(AddarticleError(e.toString()));
    }
  }

  Future submitPostArticles(BuildContext context, sc, BlogModel myarticle) async {
    emit(AddarticleLoading());
    print("------submit myarticle----");

    try {
      await postsRepo.addArticle(myarticle);

      emit(Addarticledone());
      // Navigator.pushNamed(context, BottomTabBarr.routeName);
    } catch (e) {
      // Mystyle.err(sc, e.toString());
      emit(AddarticleError(e.toString()));
    }
  }
}

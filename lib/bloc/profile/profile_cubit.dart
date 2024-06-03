import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gooto/models/user_model.dart';
import 'package:gooto/screen/bottom_tab.dart';
import 'package:gooto/services/service/auth_service.dart';
import 'package:gooto/services/service/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  ProfileRepository profileRepository = ProfileRepository();
  UserModel? user;
  Future profile() async {
    emit(ProfileLoading());

    try {
      user = await profileRepository.getprofile();

      debugPrint("UserModel user " + user!.firstname.toString());
      emit(ProfileLoaded(user!));
    } catch (e) {
      emit(ProfileError("Couldn't get Profile."));
    }
  }

  Future changeName(x) async {}

  File? image;
  var picker = ImagePicker();
  var downloadUrlimage = "";

  UserRepository userRepository = UserRepository();

  Future editprofile(usernew, context) async {
    emit(ProfileLoading());

    try {
      user = await userRepository.edi_profile(usernew);

      debugPrint("UserModel user " + user!.firstname.toString());
      emit(ProfileLoaded(user!));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomTabBarr()),
      );
    } catch (e) {
      print("Couldn't get Profile : " + e.toString());
      emit(ProfileError("Couldn't get Profile."));
    }
  }
}

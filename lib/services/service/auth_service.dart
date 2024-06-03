import 'dart:async';
import 'package:gooto/models/user_model.dart';
import 'package:gooto/services/api/api.dart';
import 'package:gooto/services/api/auth_api.dart';
import 'package:gooto/services/api/user_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  UserModel myuserModel = UserModel();
  AuthApi auth = AuthApi();
  Api api = Api();
  // AuthApi _authApi = AuthApi();

  Future register(UserModel newuser) async {
    print("register serv");

    return await auth.register(newuser);
  }

  Future login(UserModel newuser) async {
    print("login serv");

    var response = await api.httpPost("v1/users/login", newuser.logintoJson());
    // var response = login()
    UserRepository().saveToken(response);

    return response;
  }

  Future<bool> issigned() async {
    return await auth.getisSign();
  }

  Future<String> getTokenFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    api.token = prefs.getString("access_token") ?? "";
    return api.token.toString();
  }

  Future<UserModel> saveToken(response) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove("access_token");
    prefs.setString("access_token", response['token']);
    api.token = prefs.getString("access_token")!;

    myuserModel = UserModel.fromData(response);
    return myuserModel;
  }

  Future<bool> getUser(response) async {
    myuserModel = UserModel.fromJson(response);
    return true;
  }

  Future<bool> signOut() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove("access_token");
    return true;
  }

  Future edi_profile(UserModel newdata) async {
    var response = await UserApi().update(newdata);
    saveToken(response);
    UserModel user = UserModel.fromJson(response);
    return user;
  }
}

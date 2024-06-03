import 'dart:convert';
import 'package:gooto/models/user_model.dart';
import 'package:gooto/services/api/api.dart';

class UserApi {
  Api api = Api();

  Future<dynamic> update(UserModel user) async {
    print("update profile user_api");
    return await api.httpPut('v1/users/profile', user.toJsononly2());
  }

  Future<dynamic> uploadImage(var file) async {
    return await api.httpPostWithFile('save_avatar', file: file);
  }

  Future<dynamic> getUserApi() async {
    return await api.httpGet('v1/users/profile');
  }

  Future<dynamic> getUserByIDApi(id) async {
    return await api.httpGet('v1/users/$id');
  }

  Future<dynamic> postReportApi(String id, message) async {
    return await api.httpPost('v1/users/$id/report', jsonEncode(message));
  }

  Future<dynamic> deleteUserApi() async {
    return await api.httpDelete('v1/users/profile');
  }
}

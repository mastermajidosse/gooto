import 'package:gooto/models/user_model.dart';
import 'package:gooto/services/api/api.dart';

class AuthApi {
  Api api = Api();

  static final AuthApi _authApi = AuthApi._internal();

  factory AuthApi() {
    return _authApi;
  }

  AuthApi._internal();

  Future<dynamic> login(UserModel user) async {
    return await api.httpPost("v1/users/login", user.logintoJson());
  }

  Future<dynamic> register(UserModel user) async {
    print("registerapi");
    return await api.httpPost("v1/users/register", user.registertoJson());
  }

  Future<dynamic> getUserProfile() async {
    return await api.httpGet('v1/users/profile');
  }

  Future<dynamic> getisSign() async {
    var response = await api.httpGetCheck('v1/users/profile');

    return response == 401 ? false : true;
  }

  // Future<dynamic> logout() async {
  //   return await api.httpPost(jsonEncode({}));
  // }

  // Future<dynamic> recoverPassword(String email) async {
  //   print("{'email': email}");
  //   print({'email': email});
  //   return await api.httpPost(jsonEncode({'email': email}));
  // }
}

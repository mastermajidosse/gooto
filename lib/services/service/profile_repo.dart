import 'package:gooto/models/user_model.dart';
import 'package:gooto/services/api/api.dart';
import 'package:gooto/services/api/user_api.dart';

class ProfileRepository {
  UserApi userApi = UserApi();
  Api api = Api();

  UserModel userM = UserModel();

  Future getprofile() async {
    var response = await userApi.getUserApi();
    UserModel user = UserModel.fromJson(response['user']);
    return user;
  }

  Future getFriend(String uid) async {
    // DocumentSnapshot dc = await _firestore.collection('users').doc(uid).get();

    // UserModel userModel = UserModel.fromData(dc.data());
    // return userModel;
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gooto/models/user_model.dart';
import 'package:gooto/services/service/auth_service.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  UserModel userdata = UserModel();
  UserRepository userRepository = UserRepository();

  registerNew(UserModel new_user, context) async {
    emit(SignupLoading());
    try {
      print("SignupLoading");
      var response = await userRepository.register(new_user);
      UserRepository().saveToken(response);
      userdata = UserModel.fromJson(response);

      // print(myuserModel.email);
      emit(SignupSuccess(userdata));
    } catch (e) {
      emit(SignupError("Couldn't Signup : " + e.toString()));
    }
  }
}

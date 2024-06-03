import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooto/models/user_model.dart';
import 'package:gooto/services/service/auth_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  UserRepository userRepository = UserRepository();

  UserModel userdata = UserModel();

  login(context, String email, String pass) async {
    emit(LoginLoading());

    try {
      var response = await userRepository.login(UserModel(email: email, password: pass));
      // await BlocProvider.of<AuthCubit>(context)
      //   ..checkAuth();

      emit(LoginSuccess(userdata));
    } catch (e) {
      emit(LoginError("Couldn't Login : " + e.toString()));
    }
  }
}

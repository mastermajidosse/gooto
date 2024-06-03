import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooto/bloc/profile/profile_cubit.dart';
import 'package:gooto/services/service/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  UserRepository userRepository = UserRepository();

  checkAuth(context) async {
    try {
      String sign = await userRepository.getTokenFromPreferences();
      // print(sign);
      bool response = await userRepository.issigned();

      // print("isSignedIn :" + response.toString());
      if (response) {
        print("Authenticated");
        BlocProvider.of<ProfileCubit>(context).profile();

        emit(Authenticated(sign));
      } else {
        print("Unauthenticated");
        emit(Unauthenticated());
      }
    } catch (_) {
      print("Unauthenticated");
      emit(Unauthenticated());
    }
  }
}

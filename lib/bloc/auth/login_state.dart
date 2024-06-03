part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginNExt extends LoginState {
  const LoginNExt();
  @override
  List<Object> get props => [];
}

class MovetoHome extends LoginState {
  const MovetoHome();
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  final UserModel myuser;
  const LoginSuccess(this.myuser);

  @override
  List<Object> get props => [];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginSuccess && other.myuser == myuser;
  }

  @override
  int get hashCode => myuser.hashCode;
}

class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

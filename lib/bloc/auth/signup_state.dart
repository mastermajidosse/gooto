part of 'signup_cubit.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {
  const SignupLoading();
}

class SignupNExt extends SignupState {
  const SignupNExt();
  @override
  List<Object> get props => [];
}

class MovetoHome extends SignupState {
  const MovetoHome();
  @override
  List<Object> get props => [];
}

class SignupSuccess extends SignupState {
  final UserModel myuser;
  const SignupSuccess(this.myuser);

  @override
  List<Object> get props => [];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignupSuccess && other.myuser == myuser;
  }

  @override
  int get hashCode => myuser.hashCode;
}

class SignupError extends SignupState {
  final String message;
  const SignupError(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignupError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

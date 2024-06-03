part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class Uninitialized extends AuthState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Uninitialized';
}

class Authenticated extends AuthState {
  final String token;

  Authenticated(this.token);

  @override
  String toString() => 'Authenticated { token: $token }';

  @override
  List<Object> get props => [token];
}

class Unauthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSigUp extends AuthEvent {
  final String name;
  final String email;
  final String password;

  AuthSigUp({required this.name, required this.email, required this.password});
}

final class AuthLogin extends AuthEvent {
  final String email;
  final String password;

  AuthLogin({required this.email, required this.password});
}

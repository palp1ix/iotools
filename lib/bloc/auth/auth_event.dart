part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class SignIn extends AuthEvent {
  final String email;
  final String password;

  SignIn({required this.email, required this.password});
}

final class SignUp extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final int companyId;

  SignUp({
    required this.email,
    required this.password,
    required this.companyId,
    required this.name,
  });
}

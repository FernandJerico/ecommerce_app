part of 'auth_bloc.dart';

class AuthEvent {
  const AuthEvent();
}

class ToggleObscureTextEvent extends AuthEvent {}

class NameEvent extends AuthEvent {
  final String name;
  const NameEvent(this.name);
}

class EmailEvent extends AuthEvent {
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends AuthEvent {
  final String password;
  const PasswordEvent(this.password);
}

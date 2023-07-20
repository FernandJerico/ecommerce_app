part of 'auth_bloc.dart';

class AuthState {
  final String name;
  final String email;
  final String password;
  final bool obscureText;

  const AuthState({
    this.name = "",
    this.email = "",
    this.password = "",
    this.obscureText = true,
  });

  AuthState copyWith({
    String? name,
    String? email,
    String? password,
    bool? obscureText,
  }) {
    return AuthState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      obscureText: obscureText ?? this.obscureText,
    );
  }
}

class AuthInitial extends AuthState {}

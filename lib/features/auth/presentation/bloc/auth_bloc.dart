import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<NameEvent>(_nameEvent);

    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);

    on<ToggleObscureTextEvent>(_toggleObscureTextEvent);
  }

  void _nameEvent(NameEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _emailEvent(EmailEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _toggleObscureTextEvent(
      ToggleObscureTextEvent event, Emitter<AuthState> emit) {
    final currentState = state;
    emit(currentState.copyWith(obscureText: !currentState.obscureText));
  }
}

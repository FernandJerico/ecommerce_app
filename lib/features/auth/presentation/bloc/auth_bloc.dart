import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<NameEvent>(_nameEvent);

    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);

    on<ToggleObscureTextEvent>(_toggleObscureTextEvent);

    on<AuthEvent>(_onTimerEvent);
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

  Timer? _timer;

  void _onTimerEvent(AuthEvent event, Emitter<AuthState> emit) async {
    if (event is StartTimerEvent) {
      await _startTimer(event.durationInSeconds, emit);
    } else if (event is TimerTickEvent) {
      _handleTimerTick(event.remainingSeconds, emit);
    }
  }

  Future<void> _startTimer(
      int durationInSeconds, Emitter<AuthState> emit) async {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }

    emit(TimerRunningState(durationInSeconds));

    for (var tick = 1; tick <= durationInSeconds; tick++) {
      await Future.delayed(const Duration(seconds: 1));

      final int remainingSeconds = durationInSeconds - tick;

      if (remainingSeconds > 0) {
        emit(TimerRunningState(remainingSeconds));
      } else {
        _timer!.cancel();
        emit(TimerFinishedState());
        break; // Hentikan loop setelah timer selesai
      }
    }
  }

  void _handleTimerTick(int remainingSeconds, Emitter<AuthState> emit) {
    if (remainingSeconds < 0) {
      emit(TimerRunningState(remainingSeconds));
    } else {
      emit(TimerFinishedState());
    }
  }

  @override
  Future<void> close() {
    _timer!.cancel();
    return super.close();
  }
}

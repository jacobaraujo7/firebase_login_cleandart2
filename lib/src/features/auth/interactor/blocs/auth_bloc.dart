import 'package:firebase_login_cleandart2/src/features/auth/interactor/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/auth_event.dart';
import '../states/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService service;

  AuthBloc(this.service) : super(const LogoutedAuthState()) {
    on<LoginAuthEvent>(_loginAuthEvent);
    on<LogoutAuthEvent>(_logoutAuthEvent);
  }

  void _loginAuthEvent(LoginAuthEvent event, emit) async {
    emit(const LoadingAuthState());
    final newState = await service.login(
      event.email,
      event.password,
    );
    emit(newState);
  }

  void _logoutAuthEvent(event, emit) async {
    emit(const LoadingAuthState());
    await service.logout();
    emit(const LogoutedAuthState());
  }
}

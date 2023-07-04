import '../entities/user_entity.dart';

sealed class AuthState {
  const AuthState();
}

class LoggedAuthState implements AuthState {
  final UserEntity user;

  const LoggedAuthState(this.user);
}

class LogoutedAuthState implements AuthState {
  const LogoutedAuthState();
}

class LoadingAuthState implements AuthState {
  const LoadingAuthState();
}

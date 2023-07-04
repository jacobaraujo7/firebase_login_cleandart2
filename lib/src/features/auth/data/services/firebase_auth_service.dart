import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_cleandart2/src/features/auth/data/adapters/user_adapter.dart';
import 'package:firebase_login_cleandart2/src/features/auth/interactor/states/auth_state.dart';

import '../../interactor/services/auth_service.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthService(this.firebaseAuth);

  @override
  Future<AuthState> login(String email, String password) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        final user = UserAdapter.fromFirebaseUser(result.user!);
        return LoggedAuthState(user);
      } else {
        return const LogoutedAuthState();
      }
    } catch (e) {
      return const LogoutedAuthState();
    }
  }

  @override
  Future<AuthState> logout() async {
    await firebaseAuth.signOut();
    return const LogoutedAuthState();
  }

  @override
  AuthState getUser() {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      final userEntity = UserAdapter.fromFirebaseUser(user);
      return LoggedAuthState(userEntity);
    }
    return const LogoutedAuthState();
  }
}

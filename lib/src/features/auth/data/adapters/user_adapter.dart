import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_cleandart2/src/features/auth/interactor/entities/user_entity.dart';

class UserAdapter {
  static UserEntity fromFirebaseUser(User user) {
    return UserEntity(
      id: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
      token: '',
    );
  }
}

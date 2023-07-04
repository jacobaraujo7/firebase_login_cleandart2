import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_cleandart2/src/features/auth/data/services/firebase_auth_service.dart';
import 'package:firebase_login_cleandart2/src/features/auth/interactor/blocs/auth_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import 'features/auth/interactor/services/auth_service.dart';
import 'features/auth/ui/login_page.dart';
import 'features/home/ui/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.instance<FirebaseAuth>(FirebaseAuth.instance),
        AutoBind.factory<AuthService>(FirebaseAuthService.new),
        BlocBind.singleton<AuthBloc>((i) => AuthBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage()),
        ChildRoute('/login', child: (_, __) => const LoginPage()),
      ];
}

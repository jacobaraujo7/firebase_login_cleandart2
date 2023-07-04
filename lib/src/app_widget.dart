import 'dart:async';

import 'package:firebase_login_cleandart2/src/features/auth/interactor/blocs/auth_bloc.dart';
import 'package:firebase_login_cleandart2/src/features/auth/interactor/states/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();

    _subscription = context.read<AuthBloc>().stream.listen(
      (state) {
        if (state is LoggedAuthState) {
          Modular.to.navigate('/');
        } else if (state is LogoutedAuthState) {
          Modular.to.navigate('/login');
        }
      },
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/login');

    return MaterialApp.router(
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}

import 'package:firebase_login_cleandart2/src/features/auth/interactor/events/auth_event.dart';
import 'package:firebase_login_cleandart2/src/features/auth/interactor/states/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../auth/interactor/blocs/auth_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AuthBloc>();
    final state = bloc.state;

    Widget child = const Center(
      child: Text('Não logado'),
    );

    if (state is LoggedAuthState) {
      child = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.user.email),
            ElevatedButton(
              onPressed: () {
                bloc.add(LogoutAuthEvent());
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: child,
    );
  }
}

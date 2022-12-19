import 'package:app_base_v0/app/login/bloc/bloc_login.dart';
import 'package:app_base_v0/app/login/bloc/event_login.dart';
import 'package:app_base_v0/repository/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginBloc>().state;
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              context.read<LoginBloc>().add(UsernameChanged(username: value));
            },
          ),
          TextField(
            onChanged: (value) {
              context.read<LoginBloc>().add(PasswordChanged(password: value));
            },
          ),
          Text(
              "el usuario es :${state.username.value} ,la contraseña: ${state.password.value}, validez: ${state.status.toString()}"),
          ElevatedButton(
              onPressed: () {
                RepositoryProvider.of<AuthenticationRepository>(context)
                    .logIn();
              },
              child: Text("Login"))
        ],
      )),
    );
  }
}

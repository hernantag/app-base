import 'package:app_base_v0/app/authentication/bloc/bloc_authentication.dart';
import 'package:app_base_v0/app/authentication/bloc/state_authentication.dart';
import 'package:app_base_v0/app/login/bloc/bloc_login.dart';
import 'package:app_base_v0/app/login/screens/screen_login.dart';
import 'package:app_base_v0/app/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final appRouter = GoRouter(
    routes: [
      GoRoute(
        path: "/login",
        builder: (context, state) => BlocProvider(
          create: (context) => LoginBloc(),
          child: LoginScreen(),
        ),
        name: "login",
        redirect: (context, state) {
          bool isLogged =
              context.watch<AuthenticationBloc>().state is Authenticated;
          if (isLogged) return "/";
        },
      ),
      GoRoute(
        path: "/",
        builder: (context, state) => HomeScreen(),
        name: "home",
      ),
      GoRoute(
        path: "/test",
        builder: (context, state) =>
            Scaffold(appBar: AppBar(title: Text("asd"))),
        name: "test",
      )
    ],
    redirect: (context, state) {
      print("pasamos por aqui");
      bool isLogged = context.read<AuthenticationBloc>().state is Authenticated;

      print(isLogged);
      if (!isLogged) return "/login";
    },
  );
}
